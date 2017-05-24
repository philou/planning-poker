require 'rails_helper'


describe "votes/_not_running" do

  before :each do
    @team = Team.create(name: "Daltons")
    @joe = @team.contributors.create(name: "Joe")
  end

  it "displays a Start Vote button to the animator" do
    @team.if_needed_pick_animator(@joe)

    render_partial

    expect(rendered).to have_button("Start Vote")
  end

  it "does not display a Start Vote button to other contributors" do
    render_partial

    expect(rendered).not_to have_button("Start Vote")
  end

  it "does not display any average estimate" do
    render_partial

    expect(rendered).not_to include("average estimate")
  end

  describe "When a vote has ended" do

    before :each do
      @ending = DateTime.parse("2000-05-01T08:02:34Z")
      @vote = @team.start_vote(@ending)
    end

    it "displays the average estimate" do
      @joe.estimations.create(vote: @vote, story_points: 5)

      render_partial

      expect(rendered).to include("average estimate : 5")
    end

    it "displays a question mark if no estimations were given" do
      render_partial

      expect(rendered).to include("average estimate : ?")
    end
  end

  def render_partial
    assign(:contributor, @joe)
    render partial: "votes/not_running", locals: {vote: @team.current_vote}
  end

end
