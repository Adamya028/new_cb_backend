import { json, relationship, select, text } from '@keystone-6/core/fields'
import { list } from '@keystone-6/core'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Setting = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    data: json(),
    author: relationship({ ref: 'User', ...getAuthorFieldProperties() }),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    ...dateFields,
  },
})
