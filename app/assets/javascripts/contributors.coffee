window.App.Contributors ||= {}

App.Contributors.onLoad = ->
  if (App.Vote.$voteClock().length)
    App.Vote.startCountdown(App.Vote.$voteClock().data("vote-ending"))

  return unless $(".contributors.show").length > 0

  App.Channels.Team.subscribe($('body').data('team-name'))

$(document).on "turbolinks:load", ->
  App.Contributors.onLoad()
