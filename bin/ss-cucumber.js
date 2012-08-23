#!/usr/bin/env node


var program     = require('commander');
var ssCucumber  = require('../lib/ss-cucumber.js');

program
  .version('0.0.2')
  .usage('init')
  .option('-c, --coffee', 'Provide world and step_definition files in CoffeeScript format')
  .parse(process.argv);

if (program.args[0] == "init") {
  ssCucumber.init(process.env["PWD"], program.coffee, function(){
    console.log("Your SocketStream app is now setup to use Cucumber.");
  });
};