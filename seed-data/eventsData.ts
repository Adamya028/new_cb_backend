import { getSlug } from "./stringHelpers";

const data = [
  'Dogs concert',
  'Pet contest',
  'Horse Show',
  'Music festival',
  'Birds exhibition',
  'Dogs concert',
]

export const events = data.map((event) => {
  return {
    name: event, 
    slug: getSlug(event)
  };
})