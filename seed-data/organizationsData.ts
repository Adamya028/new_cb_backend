import { getSlug } from './stringHelpers'

const data = ['Hierarchical org ', 'Divisional org', 'Matrix org', 'Team-based org']

export const organizations = data.map((organization) => {
  return {
    name: organization,
    slug: getSlug(organization),
  }
})
