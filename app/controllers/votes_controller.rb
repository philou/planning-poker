class VotesController < ApplicationController

  VOTE_DURATION = 30.seconds

  def create
    team = Team.find(params[:team_id])

    # TODO move some of this in the Team class using events
    ending = DateTime.current + VOTE_DURATION
    team.start_vote(ending)
    VoteJob.set(wait_until: ending).perform_later(team)
    TeamChannel.vote_updated(team)
  end

end
