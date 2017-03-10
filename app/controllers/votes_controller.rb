class VotesController < ApplicationController

  def create
    team = Team.find(params[:team_id])
    TeamChannel.vote_started(team, Time.now.utc + 30)
  end

end
