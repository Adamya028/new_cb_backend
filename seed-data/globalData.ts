import { getHandle } from './stringHelpers'

const data = ['Global A', 'Global B', 'Global C']

export const globals = data.map((global) => {
  return {
    name: global,
    handle: getHandle(global),
  }
})
