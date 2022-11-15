import { getSlug } from './stringHelpers'

const data = ['Amphibians', 'Fish', 'Birds', 'Mammals', 'Reptiles']

export const listings = data.map((listing) => {
  return {
    title: listing,
    slug: getSlug(listing),
  }
})
