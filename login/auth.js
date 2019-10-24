const crypto = require('crypto');
const databaseLib = require('../db/db');

function setUserPermissions(userData, callbackSuccess, callbackFail){

    let db = databaseLib.getConnection();
    let sqlQuery = "select p.id,p.tag ";
    sqlQuery += "from permissao p ";
    sqlQuery += "inner join perfilpermissao pp on (pp.permissao_id = p.id) ";
    sqlQuery += "where pp.perfil_id in(select up.perfil_id from usuarioperfil up where up.usuario_id = $1)";    
    let queryParams = [userData.id];

    db.query(sqlQuery, queryParams ,(err, recordSet) => {
        if (err) return console.log(err);

        try{
                let rows = recordSet.rows;
                if(rows.length > 0)
                {
                    let permissionsArray = [];
                    let permissionTagsArray = [];
                    for(var indice in rows){
                        var row = rows[indice];
                        permissionsArray.push(row.id);
                        permissionTagsArray.push(row.tag);
                    }
                    userData['permissions'] = permissionsArray;
                    userData['permissionTags'] = permissionTagsArray;                    
                    callbackSuccess(userData);
                }else
                {
                    callbackFail({message : 'Acesso negado.'});
                }
        }catch(err){
            console.log(err);
        }finally{
            db.end();
        }
    });
}

module.exports = {
    checkUserData: function(user, pwd, callbackSuccess, callbackFail){        
        pwd = crypto.createHash('md5').update(pwd).digest("hex");
        
        let db = databaseLib.getConnection();
        let sqlQuery = "select id,nome ";
        sqlQuery += "from usuario ";
        sqlQuery += "where username = $1 and senha = $2 and ativo = $3";
        let queryParams = [user, pwd, true];

        db.query(sqlQuery, queryParams ,(err, recordSet) => {
            if (err) return console.log(err);
            try{
                let rows = recordSet.rows;
                if(rows.length > 0){
                    let userData = rows[0];
                    setUserPermissions(userData, callbackSuccess, callbackFail);
                }else
                    callbackFail({message: 'Credenciais inválidas.'});
            }catch(err){
                console.log(err);
            }finally{
                db.end();
            }
        });
    }
};