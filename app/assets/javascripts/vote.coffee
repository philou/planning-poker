window.App.Vote ||= {}
Vote = window.App.Vote

Vote.VOTE_CLOCK_ID = "team-vote-clock"
Vote.$voteClock = ->
  $('#'+Vote.VOTE_CLOCK_ID)

Vote.startCountdown = (voteClock) ->
  endTime = moment.tz(voteClock.data("vote-ending"), "UTC")
  voteClock
    .countdown(endTime.toDate())
    .on('update.countdown', (event) ->
      $(this).html(event.strftime('%-T second%!S')))


App.Vote.onLoad = ->
  App.Vote.startCountdown(App.Vote.$voteClock())

$(document).on "turbolinks:load", ->
  App.Vote.onLoad()
