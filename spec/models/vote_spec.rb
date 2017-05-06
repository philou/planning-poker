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
end