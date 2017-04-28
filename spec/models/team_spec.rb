require 'rails_helper'

describe Team do

  before :each do
    @daltons = Team.create(name: "Daltons")
    @joe = @daltons.contributors.create(name: "Joe")
    @avrell = @daltons.contributors.create(name: "Avrell")
  end

  it "has members" do
    expect(Team.find_by(name: "Daltons").contributors.size).to eq(2)
  end

  it "can have an animator" do
    @daltons.update(animator: @joe)

    expect(Team.find_by(name: "Daltons").animator).to eq(@joe)
  end

  it "requires the animator to also be a team member" do
    @daltons.update(animator: Contributor.new(name: "Jim"))

    expect(@daltons).to be_invalid
  end

  it "picks the animator when needed" do
    @daltons.if_needed_pick_animator(@joe)

    expect(Team.find_by(name: "Daltons").animator).to eq(@joe)
  end

  it "sticks to previous the animator" do
    @daltons.update(animator: @joe)

    @daltons.if_needed_pick_animator(@avrell)

    expect(Team.find_by(name: "Daltons").animator).to eq(@joe)
  end

  it "avoids 2 members to become animator at the same time" do
    concurrent = Team.find_by(name: "Daltons")

    concurrent.if_needed_pick_animator(@joe)
    @daltons.if_needed_pick_animator(@avrell)

    expect(@daltons.animator).not_to be(@avrell)
  end

  it "knows if a member is animator" do
    @daltons.animator = @joe

    expect(@daltons.animator?(@joe)).to be true
    expect(@daltons.animator?(@avrell)).to be false
  end

  context "votes" do

    it "has some votes" do
      @daltons.votes.create(ending: DateTime.current)

      expect(@daltons.votes.size).to eq(1)
    end

  end
end