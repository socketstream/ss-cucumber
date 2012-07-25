assert        = require 'assert'
ssGenerator   = require "socketstream/lib/cli/generate.js"
fs            = require "fs"
rimraf        = require "rimraf"
ssCucumber    = require "../src/ss-cucumber"

appName       = "cheeseWin"

describe "ss-cucumber", ->

  describe "#init", ->

    before (done) ->
      ssGenerator.generate args: ["n", appName]
      setTimeout ->
        path = __dirname.replace("/test",'/'+appName)
        fs.exists path, (exists) ->
          done() if exists?
      , 1

    after (done) ->
      rimraf appName, (err) ->
        throw(new Error(err)) if err?
        done()

    it "should create a features folder in the SocketStream application's directory", (done) ->
      ssCucumber.init __dirname.replace("/test",'/'+appName), ->
        fs.exists "#{__dirname.replace('/test','/'+appName)}/features", (exists) ->
          assert exists
          done()

    # Then run ss-cucumber.init
    # Then watch it create a features folder in the SS app's directory
    # Then check that the folder we expect, exists

    it "should create a support folder inside of the features folder"

    it "should create a step_definitions folder inside of the features folder"

    it "should create a world.js file inside of the support folder"

    it "should identify if the main Socketstream file exists, and what file type it is"

    it "should create a example_step_definitions.js file inside of the step_definitions folder"

  describe "#run", ->

    it "should run Cucumber against the set of features inside of the features folder"