require 'rails_helper'


RSpec.describe Estimation, type: :model do

  before :each do
    @daltons = Team.create(name: "Daltons")
    @joe = @daltons.contributors.create(name: "Joe")
    @daltons.start_vote(DateTime.current + 1.hour)
  end

  it "requires a contributor" do
    expect(Estimation.new(vote: @daltons.current_vote)).to be_invalid
  end

  it "requires a vote" do
    expect(Estimation.new(contributor: @joe)).to be_invalid
  end

  it "requires a story points" do
    expect(Estimation.new(contributor: @joe, vote: @daltons.current_vote, story_points: -1)).to be_invalid
  end
end
