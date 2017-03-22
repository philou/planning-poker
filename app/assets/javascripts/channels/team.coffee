window.App.Channels ||= {}
window.App.Channels.Team ||= {}

App.Channels.Team.TEAM_VOTE_STATE_ID = "team-vote-state"

App.Channels.Team.TEAM_VOTE_STATE_SELECTOR = '#' + App.Channels.Team.TEAM_VOTE_STATE_ID

App.Channels.Team.subscribe = (teamName) ->
  that = this

  App.cable.subscriptions.create {channel: "TeamChannel", team_name: teamName},
    received: (data) ->
      $(that.TEAM_VOTE_STATE_SELECTOR).text(data['message'])
      endTime = moment.tz(data['end_time'], "UTC")
      $("#team-vote-start").toggle()
      $("#team-vote-countdown").toggle()
      $("#team-vote-clock")
        .countdown(endTime.toDate())
        .on('update.countdown', (event) ->
                $(this).html(event.strftime('%-T seconds remaining')))
