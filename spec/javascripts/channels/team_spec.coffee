//= require support/jasmine-jquery-2.0.0

describe "Channels/Team", ->

  it "Updates the team vote status when receiving a notification", ->
    $("body").append('<p id="team-vote-state">#team-vote-state placeholder</p>')
    channel = App.Channels.Team.subscribe('Fantastic 4')

    message = "Vote Started"
    channel.received({message: message})

    expect($("#team-vote-state")).toContainText(message)

  #TODO find a way to test that we are subscribing with the correct arguments. Maybe later commits for tests on ActionCable will help
