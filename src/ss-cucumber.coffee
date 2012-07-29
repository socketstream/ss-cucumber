fs          = require "fs"
world_js    = fs.readFileSync "#{__dirname}/../copy/world.js", 'utf8'
step_file   = fs.readFileSync "#{__dirname}/../copy/socketstream_steps.js", 'utf8'

module.exports =

  # This sets up a SocketStream application to contain
  # the necessary folders and files for using Cucumber.
  #
  init: (path, callback) ->
    fs.mkdir "#{path}/features", (err) ->
      throw err if err?
      fs.mkdir "#{path}/features/support", (err) ->
        throw err if err?
        fs.mkdir "#{path}/features/step_definitions", (err) ->
          throw err if err?
          fs.writeFile "#{path}/features/support/world.js", world_js, (err) ->
            throw err if err?
            fs.writeFile "#{path}/features/step_definitions/socketstream_steps.js", step_file, (err) ->
              throw err if err?
              callback() if callback?

  # This runs Cucumber against the set of features inside
  # of the features folder.
  #
  run: (callback) ->
    callback() if callback?