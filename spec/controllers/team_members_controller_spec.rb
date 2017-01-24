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

    it "assigns the animator if there was none" do
      post :create, params: {"Team" => "Daltons", "Name" => "Joe"}

      daltons = Team.find_by(name: "Daltons")
      expect(daltons.animator.name).to eq("Joe")
    end

    it "does not change the animator if there is already one" do
      daltons = Team.create(name: "Daltons")
      joe = TeamMember.create(name: "Joe", team: daltons)
      daltons.animator = joe
      daltons.save

      post :create, params: {"Team" => "Daltons", "Name" => "Avrel"}

      expect(Team.find_by(name: "Daltons").animator).to eq(joe)
    end

  end

  describe "GET show" do
    render_views

    it "displays the animator view if the team member is the animator" do
      daltons = Team.create(name: "Daltons")
      joe = TeamMember.create(name: "Joe", team: daltons)
      daltons.update(animator: joe)

      get :show, params: { id: joe }

      expect(response.body).to include("animator").and include("Daltons").and include("Joe")
    end

    it "displays the voter view otherwise" do
      daltons = Team.create(name: "Daltons")
      avrel = TeamMember.create(name: "Avrel", team: daltons)

      get :show, params: { id: avrel }

      expect(response.body).to include("voter").and include("Daltons").and include("Avrel")
    end

  end

end
