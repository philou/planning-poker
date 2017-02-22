class VotesController < ApplicationController

  def create
    team = Team.find(params[:team_id])
    TeamChannel.broadcast(team, "Vote Started")
  end

end
