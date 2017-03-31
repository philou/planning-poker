# TODO rename TeamMember to Contributor as it is very long to write
#    - create a migration to rename the table
class Contributor < ApplicationRecord

  belongs_to :team

  def team_name
    team && team.name
  end

  def animator?
    !team.nil? && team.animator?(self)
  end
end
