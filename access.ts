import { Permission, permissionsList } from './schemas/fields'
import { ListAccessArgs } from './types'

// At it's simplest, the access control returns a yes or no value depending on the users session

export function isSignedIn({ session }: ListAccessArgs) {
  return !!session
}

const generatedPermissions = Object.fromEntries(
  permissionsList.map((permission) => [
    permission,
    function ({ session }: ListAccessArgs) {
      return !!session?.data.role?.[permission]
    },
  ])
) as Record<Permission, ({ session }: ListAccessArgs) => boolean>

// Permissions check if someone meets a criteria - yes or no.
export const permissions = {
  ...generatedPermissions,
  // isAwesome({ session }: ListAccessArgs): boolean {
  //   return !!session?.data.name.includes("wes");
  // },
}

// Rule based function
// Rules can return a boolean - yes or no - or a filter which limits which products they can CRUD.
export const rules = {
  canManageUsers({ session }: ListAccessArgs) {
    if (!isSignedIn({ session })) {
      return false
    }
    if (permissions.canManageUsers({ session })) {
      return true
    }
    // Otherwise they may only update themselves!
    return { id: { equals: session?.itemId } }
  },
  canManageListing({ session }: ListAccessArgs) {
    if (!isSignedIn({ session })) {
      return false
    }
    if (permissions.canManageListing({ session })) {
      return false
    }
    return { author: { id: { equals: session?.itemId } } }
  },
  canManageAnimal({ session }: ListAccessArgs) {
    if (!isSignedIn({ session })) {
      return false
    }
    if (permissions.canManageAnimal({ session })) {
      return false
    }
    return { author: { id: { equals: session?.itemId } } }
  },
  canManageArticle({ session }: ListAccessArgs) {
    if (!isSignedIn({ session })) {
      return false
    }
    if (permissions.canManageArticle({ session })) {
      return false
    }
    return { author: { id: { equals: session?.itemId } } }
  },
  canManageEvent({ session }: ListAccessArgs) {
    if (!isSignedIn({ session })) {
      return false
    }
    if (permissions.canManageEvent({ session })) {
      return false
    }
    return { author: { id: { equals: session?.itemId } } }
  },
}
