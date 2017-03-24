//= require support/jasmine-jquery-2.0.0

#TODO find a way to test that we are subscribing with the correct arguments. Maybe later commits for tests on ActionCable will help
# I tried with server re-broadcasting and put the result in branch action-cable-test. The test failed in the browser (message did not seem to get back) and incorrectly passed in the console (it seemed to skip the asynchronous part of the test), but gave a web socket error : Error during WebSocket handshake: protocol mismatch: actioncable-v1-json,actioncable-unsupported !=

describe "Channels/Team", ->

  act = App.Channels.Team
  channel = App.Channels.Team.subscribe('Fantastic 4')

  beforeEach ->
    $(act.TEAM_VOTE_STATE_SELECTOR).remove()
    $("body").append('<p id="' + act.TEAM_VOTE_STATE_ID + '">placeholder</p>')

  it "Updates the team vote status when receiving a notification", ->
    message = "Vote Started"

    channel.received({html: message})

    expect($(act.TEAM_VOTE_STATE_SELECTOR)).toContainText(message)


  describe "Vote countdown on notifications", ->
    currentTime = "2017-03-23 10:00:00"
    endVoteTime = "2017-03-23 10:00:30Z"

    beforeEach ->
      jasmine.clock().install()
      setTimezone("UTC")

    setTimezone = (timezone) ->
      jasmine.clock().mockDate(moment.tz(currentTime, timezone).toDate())

    voteStarts = ->
      channel.received({html: "<div id=\"team-vote-clock\"></div>", end_time: endVoteTime})
      jasmine.clock().tick(800)

    afterEach ->
      jasmine.clock().uninstall()


    it "Starts", ->
      voteStarts()

      expect($("#team-vote-clock")).toContainText("30 seconds")

    it "Takes timezones into effect", ->
      setTimezone("Europe/Paris")

      voteStarts()

      expect($("#team-vote-clock")).toContainText("3630 seconds")

    it "Decreases", ->
      voteStarts()

      jasmine.clock().tick(1000)

      expect($("#team-vote-clock")).toContainText("29 seconds")

    it "Stops at 1", ->
      voteStarts()
      jasmine.clock().tick(29000)

      jasmine.clock().tick(1000)

      expect($("#team-vote-clock")).toContainText("1 second")
