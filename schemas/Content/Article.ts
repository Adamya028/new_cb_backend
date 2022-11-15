import { relationship, text, select } from '@keystone-6/core/fields'
import { list } from '@keystone-6/core'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { rules, isSignedIn } from '../../access'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Article = list({
  access: {
    operation: {
      create: isSignedIn,
    },
    filter: {
      query: rules.canManageArticle,
      update: rules.canManageArticle,
    },
  },
  fields: {
    title: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    articleType: relationship({ ref: 'Structure' }),
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
      ref: 'User.articles',
      ...getAuthorFieldProperties(),
    }),
    tags: relationship({ ref: 'Tag.articles', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    ...dateFields,
  },
})
