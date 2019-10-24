var authLib = require('./auth');
var jwt = require('jsonwebtoken');

module.exports = {
    createLoginRoutes: function(app){
        app.post('/login', (req, res) => {
            authLib.checkUserData(req.body.user, req.body.pwd, (userData) => {
                var token = jwt.sign(userData, process.env.SECRET, {
                    expiresIn: 300
                });

                let userLoginData = {
                    "id": userData.id,
                    "nome": userData.nome,
                    "permissionTags": userData.permissionTags
                };

                res.status(200).send({ auth: true, token: token, user: userLoginData });
            },
            (failData) => {
                res.status(500).send({ auth: false, token: null, message: failData.message })
            });
        });

        app.get('/load-session', (req, res) => {

            var token = req.headers['x-access-token'];
            if (!token) return res.status(401).send({ auth: false, message: 'Token de autorização não foi enviado.' });

            jwt.verify(token, process.env.SECRET, function(err, decoded) {
                if (err) return res.status(401).send({ auth: false, message: 'Sessão expirada.' });

                let sessionObject = {
                    "id": decoded.id,
                    "nome": decoded.nome,
                    "permissionTags": decoded.permissionTags
                };               

                res.status(200).send(sessionObject);
            });
        });

        app.get('/logout', (req, res) => {
            res.status(200).send({ auth: false, token: null });
        });
    }
}