# TODO migrate away from coffeescript to vanilla js

class window.App.Vote
  @VOTE_CLOCK_ID: "team-vote-clock"
  @$voteClock: ->
    $('#' + @VOTE_CLOCK_ID)

  @startCountdown: (voteClock) ->
    endTime = moment.tz(voteClock.data("vote-ending"), "UTC")
    voteClock
      .countdown(endTime.toDate())
      .on('update.countdown', (event) ->
        $(this).html(event.strftime('%-T second%!S')))


  @onLoad: ->
    this.startCountdown(@$voteClock())

$(document).on "turbolinks:load", ->
  App.Vote.onLoad()
