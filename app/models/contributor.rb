class Contributor < ApplicationRecord

  belongs_to :team
  has_many :estimations

  def team_name
    team && team.name
  end

  def animator?
    !team.nil? && team.animator?(self)
  end

  def currently_voting?
    !team.nil? && team.currently_voting?
  end

  def estimate(vote, points:)
    estimations.create(vote: vote, story_points: points)
  end

end