class VotesController < ApplicationController

  VOTE_DURATION = 30.seconds

  def create
    team = Team.find(params[:team_id])
    ending = DateTime.now + VOTE_DURATION
    team.start_vote(ending)
    TeamChannel.vote_started(team, ending)
  end

end
