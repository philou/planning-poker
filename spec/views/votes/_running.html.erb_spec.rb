require 'rails_helper'


describe "votes/_running" do

  before :each do
    @team = Team.create(name: "Daltons")
    @joe = @team.contributors.create(name: "Joe")

    @ending = DateTime.parse("2027-05-01T08:02:34Z")
    @team.start_vote(@ending)
  end

  it "renders a tag for the clock" do
    render_partial

    expect(rendered).to have_css('#team-vote-clock')
  end

  it "send the vote end time through html data" do
    render_partial

    expect(rendered).to have_xpath("//span[@data-vote-ending='2027-05-01T08:02:34Z']")
  end

  it "renders the remaining seconds" do
    Timecop.freeze(@ending - 3.seconds)

    render_partial

    expect(rendered).to match("3 seconds\\b")
  end

  it "pluralizes the remaining seconds" do
    Timecop.freeze(@ending - 1.seconds)

    render_partial

    expect(rendered).to match("1 second\\b")
  end

  PhilousPlanningPoker::FIBOS.each do |estimate|
    it "renders a button to vote #{estimate}" do
      render_partial

      expect(rendered).to have_xpath(vote_form_xpath)
      expect(rendered).to have_xpath(vote_form_xpath + "//input[@type='submit'][@name='story_points'][@value='#{estimate}']")
    end
  end

  def vote_form_xpath
    "//form[@action='#{contributor_estimations_path(@joe)}']"
  end

  def render_partial
    assign(:contributor, @joe)
    render partial: "votes/running", locals: {vote: @team.current_vote}
  end

end
