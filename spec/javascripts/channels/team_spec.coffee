//= require support/jasmine-jquery-2.0.0

describe "Channels/Team", ->

  it "Updates the team vote status when receiving a notification", ->
    $("body").append('<p id="team-vote-status">#team-vote-status placeholder</p>')
    channel = App.Channels.Team.subscribe('Fantastic 4')

    message = "Vote Started"
    channel.received({message: message})

    expect($("#team-vote-status")).toContainText(message)
