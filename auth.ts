import { createAuth } from '@keystone-6/auth'
import { statelessSessions } from '@keystone-6/core/session'
import { permissionsList } from './schemas/fields'
import { sendPasswordResetEmail } from './lib/mail'

const sessionConfig = {
  maxAge: 60 * 60 * 24 * 30, // How long they stay signed in
  secret:
    process.env.COOKIE_SECRET || '-- DEV COOKIE SECRET; CHANGE ME ajlsi434--',
}

const { withAuth } = createAuth({
  listKey: 'User',
  identityField: 'email',
  secretField: 'password',
  initFirstItem: {
    fields: ['name', 'email', 'password'],
    // TODO: Add in initial roles here
    itemData: {
      role: {
        create: {
          name: 'initial role',
          ...permissionsList.reduce((result, permission) => {
            result[permission] = true
            return result
          }, {}),
        },
      },
    },
  },
  passwordResetLink: {
    async sendToken(args) {
      // send the email
      await sendPasswordResetEmail(args.token, args.identity)
    },
  },
  sessionData: `id name email role { ${permissionsList.join(' ')} }`,
})

const session = statelessSessions(sessionConfig)

export { withAuth, session }
