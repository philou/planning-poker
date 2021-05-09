class Vote < ApplicationRecord
  belongs_to :team, required: true
  has_many :estimations
  validates :ending, presence: true

  def seconds_to_end
    seconds = ((ending.to_datetime - DateTime.current) * 1.days).to_i
    [seconds, 0].max
  end

  def running?
    DateTime.current < self.ending
  end

  def average_estimate
    average(story_points)
  end


  def estimates_histogram
    res = empty_histograms
    story_points.each do |points|
      res[points] += 1
    end
    res
  end

  private

  def empty_histograms
    PhilousPlanningPoker::FIBOS.map { |point| [point, 0] }.to_h
  end

  def story_points
    estimations.group_by(&:contributor)
               .values
               .map { |estims| estims.max_by(&:created_at) }
               .map(&:story_points)
  end

  def average(values)
    return nil if values.empty?

    values.inject(&:+).to_f / values.count
  end
end
