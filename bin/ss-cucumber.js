#!/usr/bin/env node


var program     = require('commander');
var ssCucumber  = require('../lib/ss-cucumber.js');

program
  .version('0.0.1')
  .usage('init')
  .parse(process.argv);

if (program.args[0] == "init") {
  ssCucumber.init(process.env["PWD"], function(){
    console.log("Your SocketStream app is now setup to use Cucumber.");
  });
};