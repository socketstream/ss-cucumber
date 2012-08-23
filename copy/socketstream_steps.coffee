wrap = (funk, cb) ->
  funk.end (err) ->
    if !err?
      cb()
    else
      cb.fail err

module.exports = ->

  @World = require("../support/world").World

  @Given /^I am on the homepage$/, (callback) ->
    wrap @browser.chain.session().open('/'), callback

  @Given /^I follow "([^"]*)"$/, (link, callback) ->
    wrap @browser.chain.click("link=#{link}"), callback

  @When /^I fill in "([^"]*)" with "([^"]*)"$/, (field, value, callback) ->
    wrap @browser.chain
      .fireEvent("//input[@name=\"#{field}\"]",'focus')
      .type("//input[@name=\"#{field}\"]", value)
      .fireEvent("//input[@name=\"#{field}\"]",'keyup')
      .fireEvent("//input[@name=\"#{field}\"]",'blur')
      , callback

  @When /^I press "([^"]*)"$/, (name, callback) ->
    wrap @browser.chain
      .fireEvent("//button[text()=\"#{name}\"]",'focus')
      .click("//button[text()=\"#{name}\"]")
      , callback

  @Then /^I should see "([^"]*)"$/, (content, callback) ->
    wrap @browser.chain.assertTextPresent(content), callback