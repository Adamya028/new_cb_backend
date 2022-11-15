import { list } from '@keystone-6/core'
import { relationship, select, text } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Subscription = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    subscriptionType: relationship({ ref: 'Structure' }),
    description: document(),
    stripeSubscriptionId: text(),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    featuredImage: relationship({ ref: 'Asset' }),
    media: relationship({ ref: 'Asset', many: true }),
    author: relationship({ ref: 'User', ...getAuthorFieldProperties() }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset', many: true }),
    customer: relationship({ ref: 'Customer.subscription', many: true }),
    ...dateFields,
  },
})
