var jwt = require('jsonwebtoken');
var util = require('../Util/util');

function jwtManager(){

    var self = this;
    self.serviceData = {};

    self.verifyPermission = function(serviceData, callbackAuthorized, callbackFail){

        let databaseLib = require('../db/db');
        let db = databaseLib.getConnection();
        let sqlQuery = "SELECT COUNT(pa.id) FROM permissaoatividade pa ";
        sqlQuery += "INNER JOIN atividade a ON (pa.atividade_id = a.id) ";
        sqlQuery += "WHERE a.metodo = $1 ";    
        sqlQuery += "AND a.rota = $2 ";
        sqlQuery += "AND pa.permissao_id IN(:permissions)";
        sqlQuery = sqlQuery.replace(":permissions",serviceData.permissions.join(","));
        let queryParams = [serviceData.metodo, serviceData.rota];
    
        db.query(sqlQuery, queryParams ,(err, recordSet) => {
            if (err) return console.log(err);
            try{
                    let rows = recordSet.rows;
                    if(rows.length > 0 && rows[0].count > 0)
                        callbackAuthorized();
                    else                
                        callbackFail();
                    
            }catch(err){
                console.log(err);
            }finally{
                db.end();
            }
        });
    }

    self.verifyJWT = function(req, res, next){
        var token = req.headers['x-access-token'];
        if (!token) return res.status(401).send({ auth: false, message: 'Token de autorização não foi enviado.' });
        
        jwt.verify(token, process.env.SECRET, function(err, decoded) {
            if (err) return res.status(401).send({ auth: false, message: 'Sessão expirada.' });
    
            let serviceData = {
                "metodo" : req.method,
                "rota" : self.serviceData.rota,
                "permissions" : decoded.permissions
            };
    
            self.verifyPermission(serviceData, () => {
                req.userId = decoded.id;
                req.userName = decoded.nome;
                req.permissionTags = decoded.permissionTags;
                next();
            },
            () => {
                res.status(401).send({ auth: false, message: 'Você não tem permissão para acessar este recurso.' });
            });
        });
    }
}

module.exports = {
    getInstance: function(){
        return new jwtManager();
    }
}