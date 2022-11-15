import { list } from '@keystone-6/core'
import { relationship, text, select } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Organization = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    organizationType: relationship({ ref: 'Structure' }),
    description: document(),
    stores: relationship({ ref: 'Store.organization', many: true }),
    // location:json(),
    members: relationship({ ref: 'User.organizationMembers', many: true }),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    featuredImage: relationship({ ref: 'Asset' }),
    media: relationship({ ref: 'Asset', many: true }),
    author: relationship({ ref: 'User.organization', ...getAuthorFieldProperties() }),
    tags: relationship({ ref: 'Tag.organizations', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    vendors: relationship({ ref: 'Event.vendors', many: true }),
    ...dateFields,
  },
})
