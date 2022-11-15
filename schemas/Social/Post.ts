import { relationship, text, select } from '@keystone-6/core/fields'
import { list } from '@keystone-6/core'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Post = list({
  fields: {
    streamActivityId: text({ validation: { isRequired: true } }),
    group: relationship({ ref: 'Group' }),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    author: relationship({ ref: 'User', ...getAuthorFieldProperties() }),
    tags: relationship({ ref: 'Tag', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
    ...dateFields,
  },
})
