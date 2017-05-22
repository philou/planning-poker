require 'rails_helper'

describe Vote do

  before :each do
    @daltons = Team.create(name: "Daltons")
  end

  it "must have an ending" do
    expect(Vote.new(team: @daltons, ending: DateTime.current)).to be_valid
    expect(Vote.new(team: @daltons)).to be_invalid
  end

  it "must have a team" do
    expect(Vote.new(ending: DateTime.current)).to be_invalid
  end

  it "prints the number of seconds remaining" do
    Timecop.freeze(DateTime.current)

    expect(Vote.new(ending: DateTime.current + 1.second).seconds_to_end).to eq 1
    expect(Vote.new(ending: DateTime.current + 3.second).seconds_to_end).to eq 3
    expect(Vote.new(ending: DateTime.current - 1.second).seconds_to_end).to eq 0
  end

  describe "average estimate" do

    before :each do
      @vote = Vote.new(team: @daltons, ending: DateTime.current + 1.hour)
      @joe = @daltons.contributors.create(name: "Joe")

    end

    it "is X when the only given estimation is X" do
      @joe.estimations.create(vote: @vote, story_points: 5)

      expect(@vote.average_estimate).to eq 5
    end

    it "is the average of estimations" do
      awrel = @daltons.contributors.create(name: "Awrel")

      @joe.estimations.create(vote: @vote, story_points: 5)
      awrel.estimations.create(vote: @vote, story_points: 3)

      expect(@vote.average_estimate).to eq 4
    end

    it "is nil until there are any votes" do
      expect(@vote.average_estimate).to be_nil
    end

    it "only each contributors last vote should be taken into account" do
      @joe.estimations.create(vote: @vote, story_points: 5)
      @joe.estimations.create(vote: @vote, story_points: 3)

      expect(@vote.average_estimate).to eq 3
    end

  end
end