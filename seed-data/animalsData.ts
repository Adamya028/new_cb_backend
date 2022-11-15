import { getSlug } from './stringHelpers'

const data = [
  'Bugs Bunny',
  'Lola',
  'Daffy Duck',
  'Tweety',
  'Sylvester',
  'Speedy Gonzales',
  'Road Runner',
]

export const animals = data.map((animal) => {
  return {
    name: animal,
    slug: getSlug(animal),
  }
})
