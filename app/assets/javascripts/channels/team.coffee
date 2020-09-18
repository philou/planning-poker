# TODO migrate away from coffeescript to vanilla js

window.App.Channels ||= {}

class window.App.Channels.Team

  @VOTE_STATE_ID: "team-vote-state"
  @$voteState: ->
    $('#'+@VOTE_STATE_ID)

  @subscribe: (teamName) ->
    App.cable.subscriptions.create {
      channel: "TeamChannel",
      team_name: teamName},
      received: (data) ->
        location.reload(true)
