import 'dotenv/config';
import { config } from '@keystone-6/core';
import * as schemas from './schemas';
import { insertSeedData } from './seed-data';
import { extendGraphqlSchema } from './mutations';
import { withAuth, session } from './auth'

const databaseURL =
  process.env.DATABASE_URL ||
  'postgres://postgres:example1254@localhost:5432/keystone';


export default withAuth(
  config({
    server: {
      cors: {
        origin: [process.env.FRONTEND_URL!],
        credentials: true,
      },
      healthCheck: {
        path: '/health-check',
        data: () => ({
          status: 'keystone healthy',
          timestamp: Date.now(),
          uptime: process.uptime(),
        }),
      },
    },
    db: {
      provider: 'postgresql',
      url: databaseURL,
      async onConnect(context) {
        console.log('Connected to the database!');
        if (process.argv.includes('--seed-data')) {
          await insertSeedData(context.prisma);
        }
      },
    },
    images: {
      upload: 'local',
      local: {
        storagePath: 'public/images',
        baseUrl: '/images',
      },
    },
    lists: { ...schemas },
    extendGraphqlSchema,
    ui: {
      // Show the UI only for people who pass this test
      isAccessAllowed: ({ session }) => !!session?.data,
    },
    session,
  })
);
