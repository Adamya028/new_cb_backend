import { getHandle } from './stringHelpers'

const data = [
  'Animal',
  'Article',
  'Event',
  'Page',
  'Trait',
  'Customer',
  'Listing',
  'Store',
]

export const structures = data.map((structure) => {
  return {
    name: structure,
    handle: getHandle(structure),
  }
})
