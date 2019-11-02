var login = require('../login/loginManager');
var serviceRoutes = require('./serviceRoutes');

module.exports = {
    defineRoutes:  function(app, httpProxy){
        login.createLoginRoutes(app);
        serviceRoutes.createServiceRoutes(app, httpProxy);

        app.get('/', (req, res) => {
            res.status(200).send("Bem-vindo ao API Gateway");
        });
    }
}