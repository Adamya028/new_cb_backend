import { getSlug } from './stringHelpers'

const data = ['Wellcare pet shop', 'Raj pet shop']

export const stores = data.map((store) => {
  return {
    name: store,
    slug: getSlug(store),
  }
})
