require 'rails_helper'

describe "team_members/show" do

  it "provides an html title" do
    team = Team.create!(name: "Mogwais")

    assign(:team, team)
    assign(:team_member, TeamMember.create!(name: "Gyzmo", team: team))

    render

    expect(view.content_for(:title)).to eq(team.name)
  end
end
