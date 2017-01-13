require 'rails_helper'

describe "static_pages/home" do

  it "provides an html title" do
    render

    expect(view.content_for(:title)).to eq("Home")
  end

  it "provides an html description" do
    render

    expect(view.content_for(:description)).to eq("Run dead simple planning poker sessions for your remote team")
  end

end
