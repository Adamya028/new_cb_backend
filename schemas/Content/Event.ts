import { relationship, select, text, timestamp, json } from '@keystone-6/core/fields'
import { list } from '@keystone-6/core'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { rules, isSignedIn } from '../../access'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'
export const Event = list({
  access: {
    operation: {
      create: isSignedIn,
    },
    filter: {
      query: rules.canManageEvent,
      update: rules.canManageEvent,
    },
  },
  fields: {
    name: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    eventType: relationship({ ref: 'Structure' }),
    content: document(),
    location: json(),
    startDate: timestamp(),
    endDate: timestamp(),
    vendors: relationship({ ref: 'Organization.vendors', many: true }),
    // tickets:url?
    featuredImage: relationship({ ref: 'Asset' }),
    media: relationship({ ref: 'Asset' }),
    author: relationship({ ref: 'User.events', ...getAuthorFieldProperties() }),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    tags: relationship({ ref: 'Tag.events', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    ...dateFields,
  },
})
