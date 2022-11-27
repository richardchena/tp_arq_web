const googleapi = require('../config/googleapi')
const api_google = require('../config/googleapi')


function getGoogleAuthURL() {
    const rootUrl = 'https://accounts.google.com/o/oauth2/auth';
    const options = {
        redirect_uri: 'http://localhost:9090/auth/google',
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