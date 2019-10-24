module.exports = {
    handleService: function(serviceData, serviceProxy, request, response, next){
            let strLog = "-------------------------------------------\n";
            strLog += "Requisição ao serviço: :url\n";
            strLog += "Rota do serviço: :route\n";
            strLog += "Verbo HTTP: :method\n";
            strLog += "-------------------------------------------";

            strLog = strLog.replace(":url", serviceData.serviceurl);
            strLog = strLog.replace(":route",serviceData.rota);
            strLog = strLog.replace(":method", serviceData.metodo);
            
            console.log(strLog);
            serviceProxy(request, response, next);
    }    
};