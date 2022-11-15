import { getSlug } from './stringHelpers'

const data = [
  'Percepetive',
  'Supportive',
  'Creative',
  'Imaginative',
  'Mysterious',
  'Powerful',
  'Curious',
  'Direct',
  'Quick',
  'Confident',
  'Productive',
]

export const traits = data.map((trait) => {
  return {
    name: trait,
    slug: getSlug(trait),
  }
})
