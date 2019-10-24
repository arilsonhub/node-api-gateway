module.exports = {
    getRota: function(requestObj){
        let url = requestObj.originalUrl;        
        let getParameterCharIndex = requestObj.originalUrl.indexOf('?');
        let isGetParametersExist = (getParameterCharIndex != -1);

        if(isGetParametersExist)
            (url).substring(0,getParameterCharIndex);
            
        return url;
    }
};