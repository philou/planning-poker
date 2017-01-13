require 'rails_helper'

describe "layouts/application" do

  it "displays a title" do
    render

    expect(rendered).to have_title("Home | #{PhilousPlanningPoker::TITLE}")
  end

  # it "Team page has a title" do
  #   get
  # end


end
