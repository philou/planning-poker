require 'rails_helper'

describe "layouts/application" do

  it "sets an html title provided by individual views" do
    view.content_for(:title) { "Test" }

    render

    expect(rendered).to have_title("Test | #{PhilousPlanningPoker::TITLE}")
  end

end
