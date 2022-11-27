const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth2').Strategy;
  
passport.serializeUser((user , done) => {
    done(null , user);
})
passport.deserializeUser(function(user, done) {
    done(null, user);
});
  
passport.use(new GoogleStrategy({
    clientID:"738722521256-amjdhp1ekv1fe1bqnvehmbgoo8q24ton.apps.googleusercontent.com", // Your Credentials here.
    clientSecret:"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", // Your Credentials here.
    callbackURL:"http://localhost:9090/auth/callback",
    passReqToCallback:true
  },
  function(request, accessToken, refreshToken, profile, done) {
    return done(null, profile);
  }
));