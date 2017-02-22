//= require support/jasmine-jquery-2.0.0

describe "Channels/Team", ->
  act = App.Channels.Team

  it "Updates the team vote status when receiving a notification", ->
    $("body").append('<p id="' + act.TEAM_VOTE_STATE_ID + '">placeholder</p>')
    channel = App.Channels.Team.subscribe('Fantastic 4')

    message = "Vote Started"
    channel.received({message: message})

    expect($(act.TEAM_VOTE_STATE_SELECTOR)).toContainText(message)

  #TODO find a way to test that we are subscribing with the correct arguments. Maybe later commits for tests on ActionCable will help
  # I tried with server re-broadcasting and put the result in branch action-cable-test. The test failed in the browser (message did not seem to get back) and incorrectly passed in the console (it seemed to skip the asynchronous part of the test), but gave a web socket error : Error during WebSocket handshake: protocol mismatch: actioncable-v1-json,actioncable-unsupported !=
