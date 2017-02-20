window.App ||= {}

App.init = ->
  # put global initialization here

$(document).on "turbolinks:load", ->
  App.init()
