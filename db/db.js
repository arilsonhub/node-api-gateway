var pg = require('pg');

module.exports = {
    getConnection: function(){       

        const client = new pg.Client({
            user: process.env.DB_USER,
            host: process.env.DB_HOST,
            database: process.env.DB_DATABASE,
            password: process.env.DB_PASSWORD,
            port: process.env.DB_PORT,
          });
        client.connect();

        return client;
    }
}