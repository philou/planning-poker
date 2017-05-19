require 'rails_helper'
require 'support/matchers/action_cable_matchers'

describe TeamChannel do

  it "broadcasts on specific teams" do
    expect(ActionCable.server).to broadcast_vote_update("Daltons")

    daltons = Team.create(name: "Daltons")

    daltons.start_vote(DateTime.current)
    TeamChannel.vote_updated(daltons)
  end

  it "broadcasts with the utc date" do
    expect(ActionCable.server).to broadcast_vote_update("Daltons")

    daltons = Team.create(name: "Daltons")

    daltons.start_vote(DateTime.new(2010,12,23, 10,37,52, "+01:00"))
    TeamChannel.vote_updated(daltons)
  end

  # TODO Write unit test for the subscription when the action cable tests commits are available (https://github.com/rails/rails/pull/23211 and https://github.com/rspec/rspec-rails/issues/1606)

end
