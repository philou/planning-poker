class Vote < ApplicationRecord
  belongs_to :team
  validates :ending, presence: true
end
