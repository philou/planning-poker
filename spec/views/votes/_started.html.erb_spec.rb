require 'rails_helper'

describe "votes/_started" do

  it "renders a tag for the clock" do
    render

    expect(rendered).to have_css('#team-vote-clock')
  end

end
