class Contributor < ApplicationRecord

  belongs_to :team

  def team_name
    team && team.name
  end

  def animator?
    !team.nil? && team.animator?(self)
  end

  def currently_voting?
    !team.nil? && !team.current_vote.nil?
  end
end