class TeamMembersController < ApplicationController

  before_action :check_name_and_team_name, only: :create

  def create
    team = Team.find_or_create_by(name: params['Team'])
    team_member = TeamMember.find_or_create_by(team: team, name: params['Name'])

    team.if_needed_pick_animator(team_member)

    redirect_to team_member
  end

  def show
    # TODO only pass the team_member to the view, and delegate to the model (.team_name .animator?)
    @team_member = TeamMember.find(params['id'])
    @team = @team_member.team
  end

  private

  def check_name_and_team_name
    {  'Team' => "Please specify a non blank team name to enter the vote",
       'Name' => "Please specify a non blank name to enter the vote" }.each do |param, error_message|
      if params[param].empty?
        flash[:danger] = error_message
        redirect_to root_path
        return
      end
    end
  end

end
