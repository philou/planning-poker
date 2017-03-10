class VotesController < ApplicationController

  VOTE_DURATION = 30

  def create
    team = Team.find(params[:team_id])
    TeamChannel.vote_started(team, Time.now + VOTE_DURATION)
  end

end
