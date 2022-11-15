import { text } from '@keystone-6/core/fields'
import { list } from '@keystone-6/core'
import { dateFields } from '../dateFields'

export const Category = list({
  fields: {
    title: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    ...dateFields,
  },
})
