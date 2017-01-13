require 'rails_helper'

describe "static_pages/home" do

  it "provides an html title" do
    render

    expect(view.content_for(:title)).to eq("Home")
  end
end
