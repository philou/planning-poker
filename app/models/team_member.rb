# TODO rename TeamMember to Participant as it is very long to write
class TeamMember < ApplicationRecord
  belongs_to :team
end
