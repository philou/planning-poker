class EstimationsController < ApplicationController

  def create
    contributor = Contributor.find(params[:contributor_id])
    story_points = params[:story_points].to_i
    vote = contributor.team.current_vote
    contributor.estimations.create(vote: vote, story_points: story_points)
  end
end
