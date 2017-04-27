describe "Contributors", ->

  beforeEach ->
    $('body')
      .removeClass('contributors')
      .removeClass('show')
      .removeAttr("data-team-name")

    $('.vote-button').remove()

    spyOn(App.Channels.Team, 'subscribe').and.callThrough()


#  it "subscribes to the team channel named from the body's data", ->
#    $('body')
#      .addClass('contributors')
#      .addClass('show')
#      .attr("data-team-name","Daltons")
#
#    App.Contributors.onLoad()
#
#    expect(App.Channels.Team.subscribe).toHaveBeenCalledWith("Daltons")
#
#
#  it "doesn't subscribe to team channel outside contributors show view", ->
#    App.Contributors.onLoad()
#
#    expect(App.Channels.Team.subscribe).not.toHaveBeenCalled()

  it "disables vote buttons when one is clicked", ->
    $("body").append('<button id="first-button" class="vote-button">1</button>')
    $("body").append('<button class="vote-button">1</button>')

    App.Contributors.onLoad()

    $('#first-button').click()

    expect($('.vote-button').prop('disabled')).toBeTruthy()

