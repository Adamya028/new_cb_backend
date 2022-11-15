import { list } from '@keystone-6/core'
import { relationship, select, text } from '@keystone-6/core/fields'
import { document } from '@keystone-6/fields-document'
import { getAuthorFieldProperties } from '../getAuthorFieldProperties'

export const Group = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    description: document(),
    members: relationship({ ref: 'User.groupMember', many: true }),
    moderators: relationship({ ref: 'User.moderator', many: true }),
    status: select({
      type: 'enum',
      options: [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
      ],
    }),
    featuredImage: relationship({ ref: 'Asset' }),
    media: relationship({ ref: 'Asset', many: true }),
    author: relationship({ ref: 'User.groupAuthor', ...getAuthorFieldProperties() }),
    tags: relationship({ ref: 'Tag.groups', many: true }),
    seoTitle: text(),
    seoDescription: text(),
    seoImage: relationship({ ref: 'Asset' }),
  },
})
