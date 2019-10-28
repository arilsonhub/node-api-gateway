var pg = require('pg');

module.exports = {
    getConnection: function(){       

        const client = new pg.Client({
            user: 'azvryvtfawxcro',
            host: 'ec2-54-221-238-248.compute-1.amazonaws.com',
            database: 'degbifuv0art7r',
            password: '9b41a404227d6123b848b07bbf81863cde42aedca09f514614b9b22e83defcb9',
            port: 5432,
          });
        client.connect();

        return client;
    }
}