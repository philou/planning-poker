require 'rails_helper'
require 'support/matchers/action_cable_matchers'


RSpec.describe VotesController do

  before :each do
    @daltons = Team.create(name: "Daltons")

    @now = DateTime.new(2017, 03, 10, 9, 45, 00, "+00:00")
    freeze_time_at(@now)
  end

  it "should start a vote on the team" do
    post_create

    expect(Team.find_by(name: "Daltons").current_vote.ending).to eq(expected_vote_end_time)
  end

  it "schedules a background task to end the job in 30s" do
    ActiveJob::Base.queue_adapter = :test

    post_create

    expect(VoteJob).to(have_been_enqueued
                           .at(expected_vote_end_time)
                           .with(@daltons))
  end

  it "broadcasts a vote update" do
    expect(ActionCable.server).to broadcast_vote_update("Daltons")

    post_create
  end

  it "should not render anything" do
    post_create

    expect(response.code).to eq(HTTP::Status::NO_CONTENT.to_s)
  end

  def expected_vote_end_time
    @now + VotesController::VOTE_DURATION
  end

  def freeze_time_at(date_time)
    allow(DateTime).to receive(:current).and_return(date_time)
  end

  def post_create
    post :create, params: { team_id: @daltons.id }
  end
end
