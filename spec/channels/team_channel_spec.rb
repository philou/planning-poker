require 'rails_helper'
require 'support/matchers/action_cable_matchers'

describe TeamChannel do

  it "broadcasts on specific teams" do
    expect(ActionCable.server).to broadcast_vote_start("Daltons", "Vote screwed !")

    daltons = Team.create(name: "Daltons")

    TeamChannel.vote_started(daltons, "Vote screwed !")
  end

  # TODO Write unit test for the subscription when the action cable tests commits are available (https://github.com/rails/rails/pull/23211 and https://github.com/rspec/rspec-rails/issues/1606)

end
