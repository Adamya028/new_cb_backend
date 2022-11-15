import { getStripeCustomerId } from './stringHelpers'

export const customers = [
  {
    stripeCustomerId: getStripeCustomerId(),
  },
  {
    stripeCustomerId: getStripeCustomerId(),
  },
]
