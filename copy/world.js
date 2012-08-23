process.env["SS_ENV"] = "cucumber";
var selenium          = require('../../node_modules/ss-cucumber/node_modules/selenium-launcher');
var soda              = require('../../node_modules/ss-cucumber/node_modules/soda');
var app               = require('../../app');

var World = function(callback){
  
  selenium(function(err,selenium){
    this.browser = soda.createClient({
      host:     selenium.host,
      port:     selenium.port,
      url:      "http://localhost:3000",
      browser:  "firefox"
    });
    callback({browser: this.browser});
    process.on('exit', function(){
      selenium.kill();
    });
  })
};

exports.World = World;