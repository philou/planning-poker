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