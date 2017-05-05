class Vote < ApplicationRecord
  belongs_to :team
  validates :ending, presence: true

  def seconds_to_end
    ((ending.to_datetime - DateTime.current) * 1.days).to_i
  end
end
