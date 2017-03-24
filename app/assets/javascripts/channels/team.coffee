window.App.Channels ||= {}
window.App.Channels.Team = Team = {}

Team.VOTE_STATE_ID = "team-vote-state"
Team.$voteState = ->
  $('#'+Team.VOTE_STATE_ID)

Team.VOTE_CLOCK_ID = "team-vote-clock"
Team.$voteClock = ->
  $('#'+Team.VOTE_CLOCK_ID)

Team.subscribe = (teamName) ->
  App.cable.subscriptions.create {channel: "TeamChannel", team_name: teamName},
    received: (data) ->

      Team.$voteState().html(data['html'])

      endTime = moment.tz(data['end_time'], "UTC")
      Team.$voteClock()
        .countdown(endTime.toDate())
        .on('update.countdown', (event) ->
                $(this).html(event.strftime('%-T second%!S')))
