require 'rails_helper'
require 'support/matchers/action_cable_matchers'

describe TeamChannel do

  it "broadcasts on specific teams" do
    expect(ActionCable.server).to broadcast_vote_start("Daltons", instance_of(String))

    daltons = Team.create(name: "Daltons")

    TeamChannel.vote_started(daltons, Time.now)
  end

  it "broadcasts with the utc date" do
    expect(ActionCable.server).to broadcast_vote_start("Daltons", "2010-12-23 09:37:52")

    daltons = Team.create(name: "Daltons")

    TeamChannel.vote_started(daltons, Time.new(2010,12,23, 10,37,52, "+01:00"))
  end

  # TODO Write unit test for the subscription when the action cable tests commits are available (https://github.com/rails/rails/pull/23211 and https://github.com/rspec/rspec-rails/issues/1606)

end
