require 'rails_helper'

RSpec.describe VotesController do

  before :each do
    @daltons = Team.create(name: "Daltons")
  end

  it "create broadcasts a vote start" do
    allow(TeamChannel).to receive(:broadcast).and_call_original

    post :create, params: { team_id: @daltons.id }

    expect(TeamChannel).to have_received(:broadcast)
                                   .with(@daltons, "Vote Started")
  end

  it "should not render anything" do
    post :create, params: { team_id: @daltons.id }

    expect(response.code).to eq(HTTP::Status::NO_CONTENT.to_s)
  end
end
