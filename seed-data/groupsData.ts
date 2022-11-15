import { getHandle } from './stringHelpers'

const data = [
  'Voluntary Group',
  'Involuntary Group',
  'Informal Group',
  'Formal Group',
  'Selling Group',
  'Support Group',
]

export const groups = data.map((group) => {
  return {
    name: group,
    handle: getHandle(group),
  }
})
