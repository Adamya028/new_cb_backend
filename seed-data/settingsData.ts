import { getHandle } from './stringHelpers'

const data = ['Setting 1', 'Setting 2', 'Setting 3']

export const settings = data.map((setting) => {
  return {
    name: setting,
    handle: getHandle(setting),
  }
})
