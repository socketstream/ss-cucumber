process.env["SS_ENV"] = "cucumber"
selenium          = require '../../node_modules/ss-cucumber/node_modules/selenium-launcher'
soda              = require '../../node_modules/ss-cucumber/node_modules/soda'
app               = require '../../app'
browser           = null

World = (callback) ->

  if browser is null  
    selenium (err,selenium) ->
      browser = soda.createClient
        host:     selenium.host
        port:     selenium.port
        url:      "http://localhost:3000"
        browser:  "firefox"

      @browser = browser
      callback {@browser}
      process.on 'exit', -> selenium.kill()
  else
    @browser = browser
    callback {@browser}

exports.World = World