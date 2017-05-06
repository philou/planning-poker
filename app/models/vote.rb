class Vote < ApplicationRecord
  belongs_to :team
  validates :ending, presence: true

  def seconds_to_end
    seconds = ((ending.to_datetime - DateTime.current) * 1.days).to_i
    [seconds, 0].max
  end
end
