require 'rails_helper'

describe Team do

  before :each do
    @daltons = Team.create(name: "Daltons")
    @joe = @daltons.team_members.create(name: "Joe")
    @avrell = @daltons.team_members.create(name: "Avrell")
  end

  it "has members" do
    expect(Team.find_by(name: "Daltons").team_members.size).to eq(2)
  end

  it "can have an animator" do
    @daltons.update(animator: @joe)

    expect(Team.find_by(name: "Daltons").animator).to eq(@joe)
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

end
