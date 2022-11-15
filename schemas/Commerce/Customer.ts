import { list } from '@keystone-6/core'
import { relationship, text, select } from '@keystone-6/core/fields'
import { dateFields } from '../dateFields'

export const Customer = list({
  fields: {
    user: relationship({ ref: 'User.customer', many: true }),
    customerType: relationship({ ref: 'Structure' }),
    stripeCustomerId: text({ validation: { isRequired: true } }),
    subscription: relationship({ ref: 'Subscription.customer' }),
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
