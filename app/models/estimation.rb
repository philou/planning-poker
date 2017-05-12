class Estimation < ApplicationRecord
  belongs_to :contributor
  belongs_to :vote

  validates :story_points, numericality: {greater_than_or_equal_to: 0}
end
