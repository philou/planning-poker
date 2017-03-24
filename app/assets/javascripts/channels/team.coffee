window.App.Channels ||= {}
window.App.Channels.Team ||= {}

App.Channels.Team.TEAM_VOTE_STATE_ID = "team-vote-state"

App.Channels.Team.TEAM_VOTE_STATE_SELECTOR = '#' + App.Channels.Team.TEAM_VOTE_STATE_ID

App.Channels.Team.subscribe = (teamName) ->
  that = this

  App.cable.subscriptions.create {channel: "TeamChannel", team_name: teamName},
    received: (data) ->

      $(that.TEAM_VOTE_STATE_SELECTOR).html(data['html'])

      endTime = moment.tz(data['end_time'], "UTC")
      $("#team-vote-clock")
        .countdown(endTime.toDate())
        .on('update.countdown', (event) ->
                $(this).html(event.strftime('%-T second%!S')))
