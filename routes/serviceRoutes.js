var databaseLib = require('../db/db');
var serviceHandler = require('../service/serviceHandler');
var jwt = require('../jwt/jwtManager');

module.exports = {
    createServiceRoutes: function (app, httpProxy){
        
        let db = databaseLib.getConnection();
        var sqlQuery = "select serviceurl,metodo,rota from atividade";

        db.query(sqlQuery, (err, recordSet) => {
            try{
                if (err) return console.log(err);            
                let serviceList = recordSet.rows;         
                
                for(var indice in serviceList){
                
                    const serviceData = serviceList[indice];             
                    const serviceProxy = httpProxy(serviceData.serviceurl);
                    let metodoServico = serviceData.metodo.toUpperCase();
                    const jwtInstance = jwt.getInstance();
                    jwtInstance.serviceData = serviceData;

                    switch(metodoServico){
                        case "POST":
                                app.post(serviceData.rota, jwtInstance.verifyJWT ,(req, res, next) => serviceHandler.handleService(serviceData, serviceProxy, req, res, next));
                        break;
                        case "GET":
                                app.get(serviceData.rota, jwtInstance.verifyJWT ,(req, res, next) => serviceHandler.handleService(serviceData, serviceProxy, req, res, next));
                        break;
                        case "PUT":
                                app.put(serviceData.rota, jwtInstance.verifyJWT ,(req, res, next) => serviceHandler.handleService(serviceData, serviceProxy, req, res, next));
                        break;
                        case "DELETE":
                                app.delete(serviceData.rota, jwtInstance.verifyJWT ,(req, res, next) => serviceHandler.handleService(serviceData, serviceProxy, req, res, next));
                        break;
                        DEFAULT:
                                return console.log("Verbo HTTP não identificado para a rota: " + serviceData.rota);
                        break;
                    }
                }
            }catch(err){
                console.log(err);
            }finally{                
                db.end();
            }            
        });
    }
}