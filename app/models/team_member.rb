# TODO rename TeamMember to Contributor as it is very long to write
#    - rename this class
#    - rename the controller class
#    - update the routes
#    - create a migration to rename the table
class TeamMember < ApplicationRecord
  belongs_to :team

  def team_name
    team && team.name
  end

  def animator?
    !team.nil? && team.animator?(self)
  end
end
