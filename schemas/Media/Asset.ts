import { list } from '@keystone-6/core'
import { file, relationship, text, select } from '@keystone-6/core/fields'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Asset = list({
  fields: {
    file: file(),
    folder: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    altTitle: text({ validation: { isRequired: true } }),
    caption: text(),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    author: relationship({ ref: 'User.assets', ...getAuthorFieldProperties() }),
    tags: relationship({ ref: 'Tag', many: true }),
    ...dateFields,
  },
})
