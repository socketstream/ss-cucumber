fs              = require "fs"

module.exports =

  # This sets up a SocketStream application to contain
  # the necessary folders and files for using Cucumber.
  #
  init: (path, coffee, callback) ->

    file_extension  = if coffee then "coffee" else "js"
    world           = fs.readFileSync "#{__dirname}/../copy/world.#{file_extension}", 'utf8'
    step_file       = fs.readFileSync "#{__dirname}/../copy/socketstream_steps.#{file_extension}", 'utf8'

    fs.mkdir "#{path}/features", (err) ->
      throw err if err?
      fs.mkdir "#{path}/features/support", (err) ->
        throw err if err?
        fs.mkdir "#{path}/features/step_definitions", (err) ->
          throw err if err?
          fs.writeFile "#{path}/features/support/world.#{file_extension}", world, (err) ->
            throw err if err?
            fs.writeFile "#{path}/features/step_definitions/socketstream_steps.#{file_extension}", step_file, (err) ->
              throw err if err?
              callback() if callback?