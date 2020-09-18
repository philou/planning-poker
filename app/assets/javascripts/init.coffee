# TODO migrate away from coffeescript to vanilla js

window.App ||= {}

App.init = ->
  # put global initialization here

$(document).on "turbolinks:load", ->
  App.init()
