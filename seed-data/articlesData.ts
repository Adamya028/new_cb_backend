import { getSlug } from './stringHelpers'

const data = [
  'Animal Article',
  'Event Article',
  'Page Article',
  'Trait Article',
  'Customer Article',
  'Listing Article',
  'Store Article',
]

export const articles = data.map((article) => {
  return {
    title: article,
    slug: getSlug(article),
  }
})
