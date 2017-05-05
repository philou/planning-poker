window.App.Vote ||= {}
Vote = window.App.Vote

Vote.VOTE_CLOCK_ID = "team-vote-clock"
Vote.$voteClock = ->
  $('#'+Vote.VOTE_CLOCK_ID)

Vote.startCountdown = (_) ->
  endTime = moment.tz(Vote.$voteClock().data("vote-ending"), "UTC")
  Vote.$voteClock()
    .countdown(endTime.toDate())
    .on('update.countdown', (event) ->
      $(this).html(event.strftime('%-T second%!S')))
