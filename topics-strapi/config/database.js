require('dotenv').config();
module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'postgres',
        host: env('DATABASE_HOST', '127.0.0.1'),
        port: env.int('DATABASE_PORT', 5432),
        database: env('DATABASE_NAME', process.env.DATABASE_NAME),
        username: env('DATABASE_USERNAME', process.env.DATABASE_USERNAME),
        password: env('DATABASE_PASSWORD', process.env.DATABASE_PASSWORD),
      },
      options: {
        ssl: false,
      },
    },
  },
});
