require 'rails_helper'

describe "contributors/show" do

  before :each do
    @team = Team.create(name: "Mogwais")
    @contributor = Contributor.create(name: "Gyzmo", team: @team)

    assign(:contributor, @contributor)

  end

  it "provides an html title" do
    render

    expect(view.content_for(:title)).to eq(@team.name)
  end

  it "provides an html description" do
    render

    expect(view.content_for(:description)).to include(@contributor.name).and include(@team.name)
  end

  it "provides html keywords" do
    render

    expect(view.content_for(:keywords)).to include(@contributor.name).and include(@team.name)
  end

  it "provides the team name as body data attributes" do
    render

    expect(view.content_for(:extra_body_attributes)).to eq("data-team-name=\"#{@team.name}\"")
  end

  it "displays the team vote state" do
    render

    expect(rendered).to have_css('#team-vote-state')
  end

  it "displays the current vote if there is one" do
    @team.start_vote(DateTime.now + 1.hour)

    render

    expect(rendered).to have_css("#team-vote-clock")
  end

  context "when voter" do
    it "states that the user is a voter" do
      render

      expect(rendered).to include("voter")
    end
  end

  context "when animator" do
    before :each do
      @team.animator = @contributor
    end

    it "states that the user is the animator" do
      render

      expect(rendered).to include("animator")
    end

    it "can start the vote" do
      render

      expect(rendered).to have_button("Start Vote")
    end
  end

end
