class Team < ApplicationRecord
  has_many :team_members
  belongs_to :animator, class_name: "TeamMember", optional: true
end
