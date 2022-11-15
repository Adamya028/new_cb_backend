import { list } from '@keystone-6/core'
import { text, password, relationship, json, select } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { permissions, rules } from '../../access'
import { dateFields } from '../dateFields'

export const User = list({
  access: {
    operation: {
      create: () => true,
      // only people with the permission can delete themselves!
      // You can't delete yourself
      delete: permissions.canManageUsers,
    },
    filter: {
      query: rules.canManageUsers,
      update: rules.canManageUsers,
    },
  },
  ui: {
    // hide the backend UI from regular users
    hideCreate: (args) => !permissions.canManageUsers(args),
    hideDelete: (args) => !permissions.canManageUsers(args),
  },
  fields: {
    name: text({ validation: { isRequired: true } }),
    email: text({
      validation: { isRequired: true },
      isIndexed: 'unique',
      isFilterable: true,
    }),
    firstName: text(),
    lastName: text(),
    password: password(),
    about: document(),
    avatar: relationship({ ref: 'Asset' }),
    role: relationship({
      ref: 'Role.assignedTo',
      access: {
        create: permissions.canManageUsers,
        update: permissions.canManageUsers,
      },
    }),
    following: relationship({
      ref: 'User.followers',
      many: true,
    }),
    followers: relationship({
      ref: 'User.following',
      many: true,
    }),
    listings: relationship({ ref: 'Listing.author', many: true }),
    animals: relationship({ ref: 'Animal.author', many: true }),
    articles: relationship({ ref: 'Article.author', many: true }),
    events: relationship({ ref: 'Event.author', many: true }),
    pages: relationship({ ref: 'Page.author', many: true }),
    customer: relationship({ ref: 'Customer.user' }),
    store: relationship({ ref: 'Store.author', many: true }),
    groupMember: relationship({ ref: 'Group.members', many: true }),
    moderator: relationship({ ref: 'Group.moderators', many: true }),
    groupAuthor: relationship({ ref: 'Group.author', many: true }),
    organizationMembers: relationship({ ref: 'Organization.members' }),
    organization: relationship({ ref: 'Organization.author' }),
    assets: relationship({ ref: 'Asset.author' }),
    traits: relationship({ ref: 'Trait.author', many: true }),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    metadata: json(),
    ...dateFields,
  },
})
