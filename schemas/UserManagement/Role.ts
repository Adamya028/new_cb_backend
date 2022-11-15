import { checkbox, text, relationship } from '@keystone-6/core/fields'
import { list } from '@keystone-6/core'
import { permissions } from '../../access'
import { permissionFields } from '../fields'
import { dateFields } from '../dateFields'

export const Role = list({
  access: {
    operation: {
      create: permissions.canManageRoles,
      query: permissions.canManageRoles,
      update: permissions.canManageRoles,
      delete: permissions.canManageRoles,
    },
  },
  ui: {
    hideCreate: (args) => !permissions.canManageRoles(args),
    hideDelete: (args) => !permissions.canManageRoles(args),
    isHidden: (args) => !permissions.canManageRoles(args),
  },
  fields: {
    name: text({ validation: { isRequired: true } }),
    handle: text({ validation: { isRequired: true } }),
    description: text({ validation: { isRequired: true } }),
    permissions: checkbox(),
    ...dateFields,
    ...permissionFields,
    assignedTo: relationship({
      ref: 'User.role', // TODO: Add this to the User
      many: true,
      ui: {
        itemView: { fieldMode: 'read' },
      },
    }),
  },
})
