#= require support/jasmine-jquery-2.0.0

# TODO find a way to test that we are subscribing with the correct arguments.
#   Maybe later commits for tests on ActionCable will help I tried with server
#   re-broadcasting and put the result in branch action-cable-test. The test
#   failed in the browser (message did not seem to get back) and incorrectly
#   passed in the console (it seemed to skip the asynchronous part of the
#   test), but gave a web socket error : Error during WebSocket handshake:
#   protocol mismatch: actioncable-v1-json,actioncable-unsupported !=

describe "Vote", ->

  vote = window.App.Vote

  currentTime = "2017-03-23 10:00:00"
  endVoteTime = moment.tz("2017-03-23 10:00:30Z", "UTC")

  beforeEach ->
    jasmine.clock().install()
    setTimezone("UTC")

    vote.$voteClock().remove()
    $("body").append('<div id="' + vote.VOTE_CLOCK_ID + '"></div>')


  setTimezone = (timezone) ->
    jasmine.clock().mockDate(moment.tz(currentTime, timezone).toDate())

  voteStarts = ->
    vote.startCountdown(endVoteTime)
    jasmine.clock().tick(800)

  afterEach ->
    jasmine.clock().uninstall()


  it "Starts", ->
    voteStarts()

    expect(vote.$voteClock()).toContainText("30 seconds")

  it "Takes timezones into effect", ->
    setTimezone("Europe/Paris")

    voteStarts()

    expect(vote.$voteClock()).toContainText("3630 seconds")

  it "Decreases", ->
    voteStarts()

    jasmine.clock().tick(1000)

    expect(vote.$voteClock()).toContainText("29 seconds")

  it "Stops at 1", ->
    voteStarts()
    jasmine.clock().tick(29000)

    jasmine.clock().tick(1000)

    expect(vote.$voteClock()).toContainText("1 second")
