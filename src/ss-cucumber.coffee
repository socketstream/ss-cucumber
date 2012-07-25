fs = require "fs"

module.exports =

  # This sets up a SocketStream application to contain
  # the necessary folders and files for using Cucumber.
  #
  init: (path, callback) ->
    fs.mkdir "#{path}/features", (err) ->
      throw(new Error(err)) if err?
      callback() if callback?

  # This runs Cucumber against the set of features inside
  # of the features folder.
  #
  run: (callback) ->
    callback() if callback?