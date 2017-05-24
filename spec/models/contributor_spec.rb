require 'rails_helper'

describe Contributor do

  before :each do
    @daltons = Team.create(name: "Daltons")
    @joe = @daltons.contributors.create(name: "Joe")
    @avrell = @daltons.contributors.create(name: "Avrell")
    @john_doe = Contributor.new(name: "John Doe")
  end

  it "cannot be animator without a team" do
    expect(@john_doe.animator?).to be false
  end

  it "knows if is animator" do
    @daltons.animator = @joe

    expect(@joe.animator?).to be true
    expect(@avrell.animator?).to be false
  end

  it "knows its team name" do
    expect(@john_doe.team_name).to be_nil
    expect(@joe.team_name).to be @daltons.name
  end

  it "is currently voting if it's team is" do
    @daltons.start_vote(DateTime.now + 1.hour)

    expect(@joe).to be_currently_voting
  end

  it "is not currently voting if it's team is not" do
    expect(@joe).to_not be_currently_voting
  end

  it "is not currently voting if the vote has ended" do
    @daltons.start_vote(DateTime.now - 1.hour)

    expect(@joe).not_to be_currently_voting
  end

  it "is not in current vote withoug a team" do
    expect(@john_doe).to_not be_currently_voting
  end


end
