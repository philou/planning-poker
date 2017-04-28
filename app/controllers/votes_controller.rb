class VotesController < ApplicationController

  VOTE_DURATION = 30.seconds

  def create
    team = Team.find(params[:team_id])
    TeamChannel.vote_started(team, DateTime.now + VOTE_DURATION)
  end

end
