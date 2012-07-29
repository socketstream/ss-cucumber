var World = function(callback){
  
  process.env["SS_ENV"] = "cucumber";
  var selenium          = require('selenium-launcher');
  var soda              = require('soda');
  var app               = require('../../app');

  selenium(function(err,selenium){
    this.browser = soda.createClient({
      host:     selenium.host,
      port:     selenium.port,
      url:      "INSERT_URL_HERE",
      browser:  "firefox"
    });
    callback({browser: this.browser});
    process.on('exit', function(){
      selenium.kill();
    });
  })
};

exports.World = World;