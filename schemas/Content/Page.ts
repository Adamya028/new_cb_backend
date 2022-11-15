import { list } from '@keystone-6/core'
import { relationship, select, text } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Page = list({
  fields: {
    title: text({ validation: { isRequired: true } }),
    slug: text({ validation: { isRequired: true } }),
    pageType: relationship({ ref: 'Structure' }),
    content: document(),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    author: relationship({ ref: 'User.pages', ...getAuthorFieldProperties() }),
    tags: relationship({ ref: 'Tag.pages', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    ...dateFields,
  },
})
