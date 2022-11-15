import { getHandle } from './stringHelpers'

const data = ['Collection A', 'Collection B', 'Collection C', 'Collection D']

export const collections = data.map((collection) => {
  return {
    title: collection,
    handle: getHandle(collection),
  }
})
