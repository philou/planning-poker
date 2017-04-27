window.App.Contributors ||= {}

App.Contributors.onLoad = ->
  $(".vote-button").on("click", ->
    $(".vote-button").prop('disabled', true))

  return unless $(".contributors.show").length > 0

  App.Channels.Team.subscribe($('body').data('team-name'))

$(document).on "turbolinks:load", ->
  App.Contributors.onLoad()
