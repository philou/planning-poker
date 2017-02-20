window.App.TeamMembers ||= {}

App.TeamMembers.onLoad = ->
  return unless $(".team_members.show").length > 0

  App.Channels.Team.subscribe($('body').data('team-name'))

$(document).on "turbolinks:load", ->
  App.TeamMembers.onLoad()
