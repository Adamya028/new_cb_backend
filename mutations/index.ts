import { graphQLSchemaExtension } from '@keystone-6/core'

// make a fake graphql tagged template literal
const graphql = String.raw
export const extendGraphqlSchema = graphQLSchemaExtension({
  typeDefs: graphql``,
  resolvers: {
    Mutation: {},
  },
})
