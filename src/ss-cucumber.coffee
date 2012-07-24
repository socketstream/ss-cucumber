module.exports =

  # This sets up a SocketStream application to contain
  # the necessary folders and files for using Cucumber.
  #
  init: (callback) ->
    callback() if callback?

  # This runs Cucumber against the set of features inside
  # of the features folder.
  #
  run: (callback) ->
    callback() if callback?