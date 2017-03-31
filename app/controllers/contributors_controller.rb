class ContributorsController < ApplicationController

  before_action :check_name_and_team_name, only: :create

  def create
    team = Team.find_or_create_by(name: params['Team'])
    contributor = Contributor.find_or_create_by(team: team, name: params['Name'])

    team.if_needed_pick_animator(contributor)

    redirect_to contributor
  end

  def show
    @contributor = Contributor.find(params['id'])
  end

  private

  def check_name_and_team_name
    { 'Team' => "Please specify a non blank team name to enter the vote",
      'Name' => "Please specify a non blank name to enter the vote" }.each do |param, error_message|
      if params[param].empty?
        flash[:danger] = error_message
        return redirect_to root_path

      end
    end
  end

end
