'use strict';



function wrap (funk, cb) {
    funk.end(function(err){
        if (err === null || err === undefined){
            cb();
        } else {
            cb.fail(err);
        }
    });
}



module.exports = function (){

    this.World = require('../support/world').World;

    this.Given(/^I am on the homepage$/, function (callback){
        wrap(this.browser.chain.session().open('/'), callback);
    });

    this.Given(/^I follow "([^"]*)"$/, function (link, callback) {
        wrap(this.browser.chain.click('link=' + link), callback);
    });

    this.When(/^I fill in "([^"]*)" with "([^"]*)"$/, function (field, value, callback) {
        wrap(this.browser.chain
            .fireEvent('//input[@name="' + field + '"]','focus')
            .type('//input[@name="'      + field + '"]', value)
            .fireEvent('//input[@name="' + field + '"]','keyup')
            .fireEvent('//input[@name="' + field + '"]','blur'),
            callback
        );
    });

    this.When(/^I press "([^"]*)"$/, function (name, callback) {
        wrap(this.browser.chain
        .fireEvent('//button[text()="' + name + '"]','focus')
        .click('//button[text()="' + name + '"]'),
        callback);
    });

    this.Then(/^I should see "([^"]*)"$/, function (content, callback){
        wrap(this.browser.chain.assertTextPresent(content), callback);
    });

    // If you need to do something like clean/seed the database,
    // put the code here, then callback() when done.
    this.Before(function(callback){
        callback();
    });

    // This will close the selenium browser at the end of the cucumber feature
    this.After(function(callback){
        wrap(this.browser.chain.testComplete(), callback);
    });

};