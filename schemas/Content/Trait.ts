import { list } from '@keystone-6/core'
import { relationship, select, text } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Trait = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    animalType: relationship({ ref: 'Structure' }),
    content: document(),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    featuredImage: relationship({ ref: 'Asset' }),
    media: relationship({ ref: 'Asset', many: true }),
    author: relationship({ ref: 'User.traits', ...getAuthorFieldProperties() }),
    tags: relationship({ ref: 'Tag.traits', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    ...dateFields,
  },
})
