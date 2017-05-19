require 'rails_helper'
require 'support/matchers/action_cable_matchers'

RSpec.describe VoteJob, type: :job do

  it "notifies a team event" do
    daltons = Team.create(name: "Daltons")

    expect(ActionCable.server).to broadcast_vote_update("Daltons")

    VoteJob.perform_now(daltons)
  end
end
