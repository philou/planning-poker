window.App.Channels ||= {}
window.App.Channels.Team ||= {}

App.Channels.Team.subscribe = (teamName) ->
  App.cable.subscriptions.create {"TeamChannel", team: teamName},
    received: (data) ->
      $("#team-vote-status").text(data['message'])
