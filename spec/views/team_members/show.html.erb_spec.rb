require 'rails_helper'

describe "team_members/show" do

  before :each do
    @team = Team.create(name: "Mogwais")
    @team_member = TeamMember.create(name: "Gyzmo", team: @team)

    assign(:team, @team)
    assign(:team_member, @team_member)

  end

  it "provides an html title" do
    render

    expect(view.content_for(:title)).to eq(@team.name)
  end

  it "provides an html description" do
    render

    expect(view.content_for(:description)).to include(@team_member.name).and include(@team.name)
  end

  it "provides html keywords" do
    render

    expect(view.content_for(:keywords)).to include(@team_member.name).and include(@team.name)
  end

  it "states that the user is the animator" do
    @team.animator = @team_member

    render

    expect(rendered).to include("animator")
  end

  it "states that the user is a voter" do
    render

    expect(rendered).to include("voter")
  end
end
