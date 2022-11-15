import { list } from '@keystone-6/core'
import { json, relationship, text, select } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Store = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    storeType: relationship({ ref: 'Structure' }),
    description: document(),
    listings: relationship({ ref: 'Listing.store' }),
    location: json(),
    stripeStoreId: text(),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    featuredImage: relationship({ ref: 'Asset' }),
    media: relationship({ ref: 'Asset' }),
    author: relationship({ ref: 'User.store', ...getAuthorFieldProperties() }),
    tags: relationship({ ref: 'Tag.stores', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    organization: relationship({ ref: 'Organization.stores', many: true }),
    ...dateFields,
  },
})
