#= require support/jasmine-jquery-2.0.0

describe "Vote", ->

  vote = window.App.Vote

  currentTime = "2017-03-23T10:00:00"
  endVoteTime = "2017-03-23T10:00:30Z"

  beforeEach ->
    jasmine.clock().install()
    setTimezone("UTC")

    vote.$voteClock().remove()
    $("body").append('<div ' +
        'id="' + vote.VOTE_CLOCK_ID + '" ' +
        'data-vote-ending="'+ endVoteTime+'"></div>')


  setTimezone = (timezone) ->
    jasmine.clock().mockDate(moment.tz(currentTime, timezone).toDate())

  voteStarts = ->
    vote.startCountdown(vote.$voteClock())
    jasmine.clock().tick(800)

  afterEach ->
    jasmine.clock().uninstall()


  it "can start a countdown", ->
    voteStarts()

    expect(vote.$voteClock()).toContainText("30 seconds")

  it "'s countdown takes timezones into effect", ->
    setTimezone("Europe/Paris")

    voteStarts()

    expect(vote.$voteClock()).toContainText("3630 seconds")

  it "'s countdown decreases", ->
    voteStarts()

    jasmine.clock().tick(1000)

    expect(vote.$voteClock()).toContainText("29 seconds")

  it "'s countdown stops at 1", ->
    voteStarts()
    jasmine.clock().tick(29000)

    jasmine.clock().tick(1000)

    expect(vote.$voteClock()).toContainText("1 second")

  it "starts a countdown on page load", ->
    spyOn(vote, 'startCountdown').and.callThrough()

    vote.onLoad()

    expect(vote.startCountdown).toHaveBeenCalledWith(vote.$voteClock())

