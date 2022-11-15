import { getSlug } from './stringHelpers'

const data = [
  'Animal page',
  'Event page',
  'Article page',
  'Trait page',
  'Customer page',
  'Listing page',
  'Store page',
]

export const pages = data.map((page) => {
  return {
    title: page,
    slug: getSlug(page),
  }
})
