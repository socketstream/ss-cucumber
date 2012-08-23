process.env["SS_ENV"] = "cucumber"
selenium          = require '../../node_modules/ss-cucumber/node_modules/selenium-launcher'
soda              = require '../../node_modules/ss-cucumber/node_modules/soda'
app               = require '../../app'

World = (callback) ->
  
  selenium (err,selenium) ->
    @browser = soda.createClient
      host:     selenium.host
      port:     selenium.port
      url:      "http://localhost:3000"
      browser:  "firefox"

    callback {@browser}
    process.on 'exit', -> selenium.kill()

exports.World = World