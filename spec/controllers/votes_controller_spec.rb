require 'rails_helper'
require 'support/matchers/action_cable_matchers'

RSpec.describe VotesController do

  before :each do
    @daltons = Team.create(name: "Daltons")
  end

  it "create broadcasts a vote start" do
    expect(ActionCable.server).to broadcast_vote_start(@daltons.name, "Vote Started")

    post :create, params: { team_id: @daltons.id }
  end

  it "should not render anything" do
    post :create, params: { team_id: @daltons.id }

    expect(response.code).to eq(HTTP::Status::NO_CONTENT.to_s)
  end
end
