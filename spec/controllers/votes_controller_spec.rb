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

    # TODO use httpclient gem in test to have the NO_CONTENT constant defined
    expect(response.code).to eq("204")
  end
end
