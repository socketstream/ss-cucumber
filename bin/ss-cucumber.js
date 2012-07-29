#!/usr/bin/env node

var program     = require('commander');
var ssCucumber  = require('../lib/ss-cucumber.js');

program
  .version('0.0.1')
  .option('-i', '--init', 'Setup Cucumber.js with your SocketStream application')
  .parse(process.argv);

if (program.init) {
  ssCucumber.init(__dirname, function(){
    console.log("Setup cucumber with your SocketStream app.")
  });
};