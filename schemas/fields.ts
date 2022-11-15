import { checkbox } from '@keystone-6/core/fields'

export const permissionFields = {
  canSeeOtherUsers: checkbox({
    defaultValue: false,
    label: 'User can query other users',
  }),
  canManageUsers: checkbox({
    defaultValue: false,
    label: 'User can Edit other users',
  }),
  canManageRoles: checkbox({
    defaultValue: false,
    label: 'User can CRUD roles',
  }),
  canReadListing: checkbox({
    defaultValue: false,
    label: 'User can see Listing',
  }),
  canManageListing: checkbox({
    defaultValue: false,
    label: 'User can manage Listing',
  }),
  canManageAnimal: checkbox({
    defaultValue: false,
    label: 'User can see and manage Animals',
  }),
  canManageArticle: checkbox({
    defaultValue: false,
    label: 'User can see and manage Article',
  }),
  canManageEvent: checkbox({
    defaultValue: false,
    label: 'User can see and manage Event',
  }),
  canManagePage: checkbox({
    defaultValue: false,
    label: 'User can see and manage Page',
  }),
  canManageTrait: checkbox({
    defaultValue: false,
    label: 'User can see and manage Trait',
  }),
}

export type Permission = keyof typeof permissionFields

export const permissionsList: Permission[] = Object.keys(
  permissionFields
) as Permission[]
