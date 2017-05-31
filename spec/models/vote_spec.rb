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

  it "is running if it has not yet ended" do
    expect(Vote.new(ending: DateTime.current + 1.hour)).to be_running
    expect(Vote.new(ending: DateTime.current - 1.hour)).not_to be_running
  end

  describe "vote" do

    before :each do
      @vote = Vote.new(team: @daltons, ending: DateTime.current + 1.hour)

      @joe = @daltons.contributors.create(name: "Joe")
      @awrel = @daltons.contributors.create(name: "Awrel")
      @howard = @daltons.contributors.create(name: "Howard")
    end

    describe "average estimate" do

      it "is nil until there are any votes" do
        expect(@vote.average_estimate).to be_nil
      end

      it "is X when the only given estimation is X" do
        @joe.estimations.create(vote: @vote, story_points: 5)

        expect(@vote.average_estimate).to eq 5
      end

      it "is the average of estimations" do
        @joe.estimations.create(vote: @vote, story_points: 5)
        @awrel.estimations.create(vote: @vote, story_points: 3)

        expect(@vote.average_estimate).to eq 4
      end

      it "ignore old estimates" do
        @joe.estimations.create(vote: @vote, story_points: 5)
        @joe.estimations.create(vote: @vote, story_points: 3)

        expect(@vote.average_estimate).to eq 3
      end

    end

    describe "estimates histograms" do

      it "is an map with 0 votes" do
        PhilousPlanningPoker::FIBOS.each do |points|
          expect(@vote.estimates_histogram).to include({points => 0})
        end
      end

      it "is a singleton map for a single vote" do
        @joe.estimations.create(vote: @vote, story_points: 5)

        expect(@vote.estimates_histogram).to include({5 => 1})
      end

      it "ignores old estimates" do
        @joe.estimations.create(vote: @vote, story_points: 5)
        @joe.estimations.create(vote: @vote, story_points: 3)

        expect(@vote.estimates_histogram).to include({3 => 1})
      end

      it "agglomerates estimations" do
        @joe.estimations.create(vote: @vote, story_points: 5)
        @awrel.estimations.create(vote: @vote, story_points: 3)
        @howard.estimations.create(vote: @vote, story_points: 3)

        expect(@vote.estimates_histogram).to include({3 => 2, 5 => 1})
      end

    end
  end
end