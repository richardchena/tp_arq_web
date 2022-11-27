const axios = require('axios');
const googleapi = require('../config/googleapi');

function getGoogleTokens(code){
    //const url = "https://oauth2.googleapis.com/token"
    //const url = 'https://accounts.google.com/o/oauth2/token'
    const url = 'https://www.googleapis.com/oauth2/v4/token'

    const values = {
        code: code,
        client_id: googleapi.GOOGLE_CLIENT_ID,
        client_secret: googleapi.GOOGLE_CLIENT_SECRET,
        redirect_uri: "http://localhost:9090/auth/google/1",
        grant_type: "authorization_code"
    }

    //JSON.stringify(values)

    axios.post(url, values, 
        {
            headers: {
                "content-type": "application/x-www-form-urlencoded",
            }
        })
    .then(data => {
        console.log(data);
        return data.data;
    })
    .catch(err => {
        //console.log(err);
        return err;
    });
}

function getGoogleAuthURL() {
    const rootUrl = 'https://accounts.google.com/o/oauth2/auth';
    const options = {
        redirect_uri: 'http://localhost:9090/auth/google/1',
        client_id: googleapi.GOOGLE_CLIENT_ID,
        access_type: 'offline',
        response_type: 'code',
        prompt: 'consent',
        scope: [
            'https://www.googleapis.com/auth/userinfo.profile',
            'https://www.googleapis.com/auth/userinfo.email'
        ].join(' '),
    };


    const querystring = new URLSearchParams(options);

    return `${rootUrl}?${querystring.toString()}`;
}

exports.obtener = (req, res) => {
    return res.send({message: getGoogleAuthURL()});
}

exports.paso1 = (req, res) => {
    const code = req.query.code;
    return res.send({message: getGoogleTokens(code)})
}