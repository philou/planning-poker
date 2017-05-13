require 'rails_helper'

RSpec.describe EstimationsController, type: :controller do

  before :each do
    @daltons = Team.create(name: "Daltons")
    @joe = @daltons.contributors.create(name: "Joe")

    @daltons.start_vote(DateTime.current + 1.hour)

    post :create, params: { contributor_id: @joe, story_points: 3 }
  end

  it "creates an estimation for the given contributor and vote" do
    @joe.reload
    expect(Estimation.count).to eq 1
    expect(@joe.estimations.size).to eq 1
    expect(@daltons.current_vote.estimations.size).to eq 1
  end

  it "creates an estimation with the provided story points" do
    expect(Estimation.first.story_points).to eq 3
  end

  it "should not render anything" do
    expect(response.code).to eq(HTTP::Status::NO_CONTENT.to_s)
  end

end
