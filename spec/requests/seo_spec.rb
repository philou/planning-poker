require 'rails_helper'

describe "static_pages/home.html.erb", type: :request do

  it "The home page has the main title" do
    get "/"

    assert_select "title", PhilousPlanningPoker::TITLE
  end
end
