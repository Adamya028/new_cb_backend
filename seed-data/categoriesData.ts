import { getHandle } from './stringHelpers'

const data = ['Category A', 'Category B', 'Category C']

export const categories = data.map((category) => {
  return {
    title: category,
    handle: getHandle(category),
  }
})
