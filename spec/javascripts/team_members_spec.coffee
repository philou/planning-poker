describe "Team Members", ->

  beforeEach ->
    $('body')
      .removeClass('team_members')
      .removeClass('show')
      .removeAttr("data-team-name")
    spyOn(App.Channels.Team, 'subscribe').and.callThrough()


  it "subscribes to the team channel named from the body's data", ->
    $('body')
      .addClass('team_members')
      .addClass('show')
      .attr("data-team-name","Daltons")

    App.TeamMembers.onLoad()

    expect(App.Channels.Team.subscribe).toHaveBeenCalledWith("Daltons")


  it "doesn't subscribe to team channel outside team_members show view", ->
    App.TeamMembers.onLoad()

    expect(App.Channels.Team.subscribe).not.toHaveBeenCalled()
