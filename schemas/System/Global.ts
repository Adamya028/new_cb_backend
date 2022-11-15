import { relationship, text, json, select } from '@keystone-6/core/fields'
import { dateFields } from '../dateFields'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Global = {
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
}
