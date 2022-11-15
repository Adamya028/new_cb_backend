function timestamp() {
  // sometime in the last 30 days
  const stampy = Date.now() - Math.floor(Math.random() * 1000 * 60 * 60 * 24 * 30)
  return new Date(stampy).toISOString()
}
import bcryptjs from 'bcryptjs'
export const seedUser = [
  {
    name: 'seed5',
    email: 'seed7@coldblooded.com',
    password: bcryptjs.hashSync('password', 10),
  },
  {
    name: 'Sam5',
    email: 'sam8@coldblooded.com',
    password: bcryptjs.hashSync('password', 10),
  },
  {
    name: 'john',
    email: 'john65@coldblooded.com',
    password: bcryptjs.hashSync('password', 10),
  },
]
