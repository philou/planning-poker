class TeamMembersController < ApplicationController

  def create
    team = Team.find_or_create_by(name: params['Team'])
    team_member = TeamMember.find_or_create_by(team: team, name: params['Name'])

    redirect_to team_member
  end

  def show
    @team_member = TeamMember.find(params['id'])
    @team = @team_member.team
  end

end
