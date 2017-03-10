require 'rails_helper'
require 'support/matchers/action_cable_matchers'

RSpec.describe VotesController do

  before :each do
    @daltons = Team.create(name: "Daltons")
  end

  it "create broadcasts a vote start to end in 30s" do
    freeze_time(2017,03,10, 9,45,00, "+00:00")

    expect(ActionCable.server).to broadcast_vote_start(@daltons.name, "2017-03-10 09:45:30")

    post_create
  end

  it "sends the date in utc" do
    freeze_time(2017,03,10, 9,45,00, "-01:00")

    expect(ActionCable.server).to broadcast_vote_start(@daltons.name, "2017-03-10 10:45:30")

    post_create
  end

  it "should not render anything" do
    post_create

    expect(response.code).to eq(HTTP::Status::NO_CONTENT.to_s)
  end

  def freeze_time(*time_args)
    allow(Time).to receive(:now).and_return(Time.new(*time_args))
  end

  def post_create
    post :create, params: { team_id: @daltons.id }
  end
end
