import { getHandle } from './stringHelpers'

const data = ['Gold', 'Silver', 'Platinum']

export const subscriptions = data.map((subscription) => {
  return {
    name: subscription,
    handle: getHandle(subscription),
  }
})
