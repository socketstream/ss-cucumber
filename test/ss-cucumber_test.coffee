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
          if exists?
            ssCucumber.init __dirname.replace("/test",'/'+appName), false, ->
              done()
      , 1

    after (done) ->
      rimraf appName, (err) ->
        throw(new Error(err)) if err?
        done()

    it "should create a features folder in the SocketStream application's directory", (done) ->
      fs.exists "#{__dirname.replace('/test','/'+appName)}/features", (exists) ->
        assert exists
        done()

    it "should create a support folder inside of the features folder", (done) ->
      fs.exists "#{__dirname.replace('/test','/'+appName)}/features/support", (exists) ->
        assert exists
        done()

    it "should create a step_definitions folder inside of the features folder", (done) ->
      fs.exists "#{__dirname.replace('/test','/'+appName)}/features/step_definitions", (exists) ->
        assert exists
        done()

    it "should create a world.js file inside of the support folder", (done) ->
      file = "#{__dirname.replace('/test','/'+appName)}/features/support/world.js"
      fs.exists file, (exists) ->
        assert exists
        fs.readFile file, 'utf8', (err, copiedFile) ->
          fs.readFile "#{__dirname}/../copy/world.js", 'utf8', (err, originalFile) ->
            assert copiedFile == originalFile 
            done()

    it "should create a socketstream_steps.js file inside of the step_definitions folder", (done) ->
      file = "#{__dirname.replace('/test','/'+appName)}/features/step_definitions/socketstream_steps.js"
      fs.exists file, (exists) ->
        fs.readFile file, 'utf8', (err, copiedFile) ->
          fs.readFile "#{__dirname}/../copy/socketstream_steps.js", 'utf8', (err, originalFile) ->
            assert copiedFile == originalFile 
            done()

  describe "#init with coffee option", ->

    before (done) ->
      ssGenerator.generate args: ["n", appName]
      setTimeout ->
        path = __dirname.replace("/test",'/'+appName)
        fs.exists path, (exists) ->
          if exists?
            ssCucumber.init __dirname.replace("/test",'/'+appName), true, ->
              done()
      , 1

    after (done) ->
      rimraf appName, (err) ->
        throw(new Error(err)) if err?
        done()

    it "should create a world.coffee file inside of the support folder", (done) ->
      file = "#{__dirname.replace('/test','/'+appName)}/features/support/world.coffee"
      fs.exists file, (exists) ->
        assert exists
        fs.readFile file, 'utf8', (err, copiedFile) ->
          fs.readFile "#{__dirname}/../copy/world.coffee", 'utf8', (err, originalFile) ->
            assert copiedFile == originalFile 
            done()

    it "should create a socketstream_steps.coffee file inside of the step_definitions folder", (done) ->
      file = "#{__dirname.replace('/test','/'+appName)}/features/step_definitions/socketstream_steps.coffee"
      fs.exists file, (exists) ->
        fs.readFile file, 'utf8', (err, copiedFile) ->
          fs.readFile "#{__dirname}/../copy/socketstream_steps.coffee", 'utf8', (err, originalFile) ->
            assert copiedFile == originalFile 
            done()
