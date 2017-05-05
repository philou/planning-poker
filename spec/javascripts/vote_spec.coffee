#= require support/jasmine-jquery-2.0.0

describe "Vote", ->

  vote = window.App.Vote

  currentTime = "2017-03-23T10:00:00"
  endVoteTime = "2017-03-23T10:00:30Z"

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
