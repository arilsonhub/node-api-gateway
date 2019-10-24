var pg = require('pg');

module.exports = {
    getConnection: function(){       

        const client = new pg.Client({
            user: 'judice-v2',
            host: 'localhost',
            database: 'judice-api-gateway',
            password: 'judice-v2',
            port: 5432,
          });
        client.connect();

        return client;
    }
}