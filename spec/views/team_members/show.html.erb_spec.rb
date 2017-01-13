require 'rails_helper'

describe "team_members/show" do

  before :each do
    @team = Team.create!(name: "Mogwais")
    @member = TeamMember.create!(name: "Gyzmo", team: @team)

    assign(:team, @team)
    assign(:team_member, @member)

  end

  it "provides an html title" do
    render

    expect(view.content_for(:title)).to eq(@team.name)
  end

  it "provides an html description" do
    render

    expect(view.content_for(:description)).to include(@member.name).and include(@team.name)
  end

  it "provides html keywords" do
    render

    expect(view.content_for(:keywords)).to include(@member.name).and include(@team.name)
  end
end
