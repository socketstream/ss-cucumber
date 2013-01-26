process.env["SS_ENV"] = "cucumber";
var selenium          = require('../../node_modules/ss-cucumber/node_modules/selenium-launcher');
var soda              = require('../../node_modules/ss-cucumber/node_modules/soda');
var app               = require('../../app');
var browser           = null;

var World = function(callback){

  if (browser == null) {
    selenium(function(err,selenium){
      browser = soda.createClient({
        host:     selenium.host,
        port:     selenium.port,
        url:      "http://localhost:3000",
        browser:  "firefox"
      });

      this.browser = browser;
      callback({browser: this.browser});
      process.on('exit', function(){
        selenium.kill();
      });
    });

  } else {
    this.browser = browser;
    callback({browser: this.browser});
  }
  
};

exports.World = World;