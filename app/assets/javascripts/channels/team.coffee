window.App.Channels ||= {}
window.App.Channels.Team ||= {}

App.Channels.Team.subscribe = (teamName) ->
  App.cable.subscriptions.create {channel: "TeamChannel", team_name: teamName},
    received: (data) ->
      $("#team-vote-state").text(data['message'])
