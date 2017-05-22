class Vote < ApplicationRecord
  belongs_to :team
  has_many :estimations
  validates :ending, presence: true

  def seconds_to_end
    seconds = ((ending.to_datetime - DateTime.current) * 1.days).to_i
    [seconds, 0].max
  end

  def average_estimate
    story_points = estimations.group_by(&:contributor)
                              .values.map {|estims| estims.max_by(&:created_at) }
                              .map(&:story_points)
    average(story_points)
  end

  private

  def average(values)
    return nil if values.empty?

    values.inject(&:+) / values.count
  end
end
