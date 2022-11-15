import { relationship, text, select } from '@keystone-6/core/fields'
import { list } from '@keystone-6/core'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { rules, isSignedIn } from '../../access'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Animal = list({
  access: {
    operation: {
      create: isSignedIn,
    },
    filter: {
      query: rules.canManageAnimal,
      update: rules.canManageAnimal,
    },
  },
  fields: {
    name: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    animalType: relationship({ ref: 'Structure' }),
    scientificName: text({ validation: { isRequired: true } }),
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
    author: relationship({
      ref: 'User.animals',
      ...getAuthorFieldProperties(),
    }),
    tags: relationship({ ref: 'Tag.animals' }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    ...dateFields,
  },
})
