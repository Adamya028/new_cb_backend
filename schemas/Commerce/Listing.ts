import { list } from '@keystone-6/core'
import { relationship, text, select } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { rules, isSignedIn } from '../../access'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Listing = list({
  access: {
    operation: {
      create: isSignedIn,
    },
    filter: {
      query: rules.canManageListing,
      update: rules.canManageListing,
    },
  },

  fields: {
    title: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    listingType: relationship({ ref: 'Structure' }),
    price: text(),
    description: document(),
    store: relationship({ ref: 'Store.listings' }),
    stripeProductId: text(),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    featuredImage: relationship({
      ref: 'Asset',
    }),
    media: relationship({ ref: 'Asset' }),
    author: relationship({
      ref: 'User.listings',
      ...getAuthorFieldProperties(),
    }),
    tags: relationship({ ref: 'Tag.listings', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    ...dateFields,
  },
})
