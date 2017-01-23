require 'rails_helper'

RSpec.describe TeamMembersController do

  describe "POST create" do

    it "creates a team and a team member" do
      post :create, params: {"Team" => "Daltons", "Name" => "Joe"}

      daltons = Team.find_by(name: "Daltons")
      expect(daltons).not_to be_nil

      joe = TeamMember.find_by(name: "Joe", team: daltons)
      expect(joe).not_to be_nil
    end

    it "redirects to the team member" do
      post :create, params: {"Team" => "Mogwai", "Name" => "Gyzmo"}

      mogwai = Team.find_by(name: "Mogwai")
      gyzmo = TeamMember.find_by(name: "Gyzmo", team: mogwai)

      expect(response).to redirect_to(team_member_path(gyzmo))
    end

    it "reuses existing teams by name" do
      daltons = Team.create(name: "Daltons")

      post :create, params: {"Team" => "Daltons", "Name" => "Joe"}

      joe = TeamMember.find_by(name: "Joe", team: daltons)

      expect(response).to redirect_to(team_member_path(joe))
    end

    it "reuses existing team members by name and team" do
      daltons = Team.create(name: "Daltons")
      joe = TeamMember.create(name: "Joe", team: daltons)

      post :create, params: {"Team" => "Daltons", "Name" => "Joe"}

      expect(response).to redirect_to(team_member_path(joe))
    end

  end

end
