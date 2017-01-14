require 'rails_helper'

describe "layouts/application" do

  it "sets an html title provided by individual views" do
    view.content_for(:title) { "Test title" }

    render

    expect(rendered).to have_title("Test title | #{PhilousPlanningPoker::TITLE}")
  end

  it "sets an html description provided by individual views" do
    view.content_for(:description) { "Test description" }

    render

    expect(rendered).to have_css 'meta[name="description"][content="Test description"]', visible: false
  end

  it "sets html keywords provided by individual views" do
    keywords = "Test, Keyword"
    view.content_for(:keywords) { keywords }

    render

    expect(rendered).to have_css "meta[name=\"keywords\"][content=\"#{PhilousPlanningPoker::KEYWORDS}, #{keywords}\"]", visible: false
  end

  it "provides a favicon" do
    render

    expect(rendered).to have_css 'link[rel="icon"][type="image/png"][sizes="16x16"]', visible: false
  end

end
