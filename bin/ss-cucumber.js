#!/usr/bin/env node


var program     = require('commander');
var ssCucumber  = require('../lib/ss-cucumber.js');

program
  .version('0.0.1')
  .usage('init')
  .parse(process.argv);

if (program.args[0] == "init") {
  ssCucumber.init(__dirname, function(){
    console.log("Setting up cucumber with your SocketStream app.");
  });
};