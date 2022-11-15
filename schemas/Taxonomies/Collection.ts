import { list } from '@keystone-6/core'
import { relationship, select, text } from '@keystone-6/core/fields'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Collection = list({
  fields: {
    title: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    // items:relationship(),
    author: relationship({ ref: 'User', ...getAuthorFieldProperties() }),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    tags: relationship({ ref: 'Tag', many: true }),
    ...dateFields,
  },
})
