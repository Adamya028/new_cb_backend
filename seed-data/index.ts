import { animals } from "./animalsData"
import { seedUser } from "./data"
import { PrismaClient } from '.prisma/client'
import { articles } from "./articlesData"
import { categories } from "./categoriesData"
import { collections } from "./collectionsData"
import { events } from "./eventsData"
import { globals } from "./globalData"
import { groups } from "./groupsData"
import { listings } from "./listingData"
import { organizations } from "./organizationsData"
import { pages } from "./pageData"
import { posts } from "./postsData"
import { settings } from "./settingsData"
import { structures } from "./structuresData"
import { subscriptions } from "./subscriptionData"
import { tags } from "./tagsData"
import { traits } from "./traitsData"
import { customers } from "./customersData"
import { stores } from "./storesData"
const getRandomUserId = (users: Array<{ id: string }>) =>
  users[Math.floor(Math.random() * users.length)].id

export async function insertSeedData(prisma: PrismaClient) {
  console.log(` 🌱 Adding users: ${seedUser.length}`)
  const { id: roleId } = await prisma.role.create({
    data: {
      name: 'seed-role',
      canManageUsers: true,
      canManageRoles: true,
      canManageArticle: true,      
      canSeeOtherUsers: true,
    },
  })
  const users = await Promise.all(
    seedUser.map(async (user) => {
      console.log(`${user.name}`)
      return prisma.user.create({ data: { ...user, roleId } })
    }),
  )
  console.log(` 🌱 Adding animals: ${animals.length}`)
  animals.forEach((animal) => {
    console.log(`${animal.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...animal, ...{ authorId } }
    prisma.animal.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding articles: ${articles.length}`)
  articles.forEach((article) => {
    console.log(`${article.title}`)
    const authorId = getRandomUserId(users)
    const data = { ...article, ...{ authorId } }
    prisma.article.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding categories: ${categories.length}`)
  categories.forEach((category) => {
    console.log(`${category.title}`)
    prisma.category.create({ data: category }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding collections: ${collections.length}`)
  collections.forEach((collection) => {
    console.log(`${collection.title}`)
    
    prisma.collection.create({ data:collection }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding events: ${events.length}`)
  events.forEach((event) => {
    console.log(`${event.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...event, ...{ authorId } }
    prisma.event.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding globals: ${globals.length}`)
  globals.forEach((global) => {
    console.log(`${global.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...global, ...{ authorId } }
    prisma.global.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding groups: ${groups.length}`)
  groups.forEach((group) => {
    console.log(`${group.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...group, ...{ authorId } }
    prisma.group.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding listings: ${listings.length}`)
  listings.forEach((listing) => {
    console.log(`${listing.title}`)
    const authorId = getRandomUserId(users)
    const data = { ...listing, ...{ authorId } }
    prisma.listing.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding organizations: ${organizations.length}`)
  organizations.forEach((organization) => {
    console.log(`${organization.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...organization, ...{ authorId } }
    prisma.organization.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding pages: ${pages.length}`)
  pages.forEach((page) => {
    console.log(`${page.title}`)
    const authorId = getRandomUserId(users)
    const data = { ...page, ...{ authorId } }
    prisma.page.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding posts: ${posts.length}`)
  posts.forEach((post) => {
    console.log(`${post.streamActivityId}`)
    const authorId = getRandomUserId(users)
    const data = { ...post, ...{ authorId } }
    prisma.post.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding settings: ${settings.length}`)
  settings.forEach((setting) => {
    console.log(`${setting.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...setting, ...{ authorId } }
    prisma.setting.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding structures: ${structures.length}`)
  structures.forEach((structure) => {
    console.log(`${structure.name}`)
    prisma.structure.create({ data:structure }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding subscriptions: ${subscriptions.length}`)
  subscriptions.forEach((subscription) => {
    console.log(`${subscription.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...subscription, ...{ authorId } }
    prisma.subscription.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding tags: ${tags.length}`)
  tags.forEach((tag) => {
    console.log(`${tag.title}`)
    prisma.tag.create({ data:tag }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding traits: ${traits.length}`)
  traits.forEach((trait) => {
    console.log(`${trait.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...trait, ...{ authorId } }
    prisma.trait.create({ data }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding customers: ${customers.length}`)
  customers.forEach((customer) => {
    prisma.customer.create({ data:customer }).catch((err) => {
      console.log(err)
    })
  })
  console.log(` 🌱 Adding stores: ${stores.length}`)
  stores.forEach((store) => {
    console.log(`${store.name}`)
    const authorId = getRandomUserId(users)
    const data = { ...store, ...{ authorId } }
    prisma.store.create({ data }).catch((err) => {
      console.log(err)
    })
  })

}