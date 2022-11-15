import { getHandle } from './stringHelpers'

const data = [
  'Animal Tag',
  'Article Tag',
  'Event Tag',
  'Page Tag',
  'Trait Tag',
  'Customer Tag',
  'Listing Tag',
  'Store Tag',
]

export const tags = data.map((tag) => {
  return {
    title: tag,
    handle: getHandle(tag),
  }
})
