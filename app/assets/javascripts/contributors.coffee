class window.App.Contributors

  @onLoad: ->
    return unless $(".contributors.show").length > 0

    App.Channels.Team.subscribe($('body').data('team-name'))

$(document).on "turbolinks:load", ->
  App.Contributors.onLoad()
