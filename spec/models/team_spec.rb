require 'rails_helper'

describe Team do

  it "has members" do
    daltons = Team.create(name: "Daltons")
    daltons.team_members.create(name: "Joe")
    daltons.team_members.create(name: "Avrell")

    expect(Team.find_by(name: "Daltons").team_members.size).to eq(2)
  end


  it "can have an animator" do
    daltons = Team.create(name: "Daltons")
    joe = daltons.team_members.create(name: "Joe")

    daltons.animator = joe
    daltons.save

    expect(Team.find_by(name: "Daltons").animator).to eq(joe)
  end

end
