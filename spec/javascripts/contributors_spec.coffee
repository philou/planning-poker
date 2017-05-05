describe "Contributors", ->

  team = App.Channels.Team
  contributors = App.Contributors
  vote = App.Vote

  beforeEach ->
    $('body')
      .addClass('contributors')
      .addClass('show')
      .attr("data-team-name","Daltons")
    spyOn(team, 'subscribe').and.callThrough()


  it "subscribes to the team channel named from the body's data", ->
    contributors.onLoad()

    expect(team.subscribe).toHaveBeenCalledWith("Daltons")


  it "doesn't subscribe to team channel outside contributors show view", ->
    $('body')
      .removeClass('contributors')
      .removeClass('show')
      .removeAttr("data-team-name")

    contributors.onLoad()

    expect(team.subscribe).not.toHaveBeenCalled()

  describe "Vote countdown on notifications", ->
    currentTime = "2017-03-23 10:00:00"
    endVoteTime = "2017-03-23 10:00:30Z"

    beforeEach ->
      jasmine.clock().install()
      jasmine.clock().mockDate(moment.tz(currentTime, "UTC").toDate())

    afterEach ->
      jasmine.clock().uninstall()

    it "starts a countdown when there is one", ->
      $("body")
        .append('<div ' +
          'id="' + vote.VOTE_CLOCK_ID + '" '+
          'data-vote-ending="' + endVoteTime + '"></div>')

      contributors.onLoad()

      jasmine.clock().tick(800)
      expect(vote.$voteClock()).toContainText("30 seconds")

