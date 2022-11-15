import { list } from '@keystone-6/core'
import { json, text } from '@keystone-6/core/fields'
import { dateFields } from '../dateFields'

export const Structure = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    structure: json(),
    ...dateFields,
  },
})
