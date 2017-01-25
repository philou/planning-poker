class Team < ApplicationRecord
  has_many :team_members
  belongs_to :animator, class_name: "TeamMember", optional: true

  def if_needed_pick_animator(team_member)
    begin
      if self.animator.nil?
        self.update(animator: team_member)
      end

    rescue ActiveRecord::StaleObjectError => e
      reload
    end
  end

  def animator?(team_member)
    self.animator == team_member
  end
end
