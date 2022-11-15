import { list } from '@keystone-6/core'
import { relationship, text } from '@keystone-6/core/fields'
import { dateFields } from '../dateFields'

export const Tag = list({
  fields: {
    title: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    tagType: relationship({ ref: 'Structure' }),
    listings: relationship({ ref: 'Listing.tags', many: true }),
    stores: relationship({ ref: 'Store.tags', many: true }),
    animals: relationship({ ref: 'Animal.tags', many: true }),
    articles: relationship({ ref: 'Article.tags', many: true }),
    events: relationship({ ref: 'Event.tags', many: true }),
    pages: relationship({ ref: 'Page.tags', many: true }),
    traits: relationship({ ref: 'Trait.tags', many: true }),
    groups: relationship({ ref: 'Group.tags', many: true }),
    organizations: relationship({ ref: 'Organization.tags' }),
    ...dateFields,
  },
})
