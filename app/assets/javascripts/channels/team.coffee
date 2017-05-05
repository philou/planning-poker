window.App.Channels ||= {}
window.App.Channels.Team ||= {}
Team = window.App.Channels.Team

Team.VOTE_STATE_ID = "team-vote-state"
Team.$voteState = ->
  $('#'+Team.VOTE_STATE_ID)

Team.subscribe = (teamName) ->
  App.cable.subscriptions.create {channel: "TeamChannel", team_name: teamName},
    received: (data) ->
      location.reload(true)
