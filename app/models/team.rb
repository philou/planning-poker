class Team < ApplicationRecord
  has_many :contributors
  belongs_to :animator, class_name: "Contributor", optional: true
  validate :animator_must_be_contributor

  has_many :votes

  def if_needed_pick_animator(contributor)
    # TODO The optimistic lock is not great, they could still have race conditions when getting out of the role of animator, maybe emitting raw sql would be better (arel is an sql ast builder)
    begin
      if self.animator.nil?
        self.update(animator: contributor)
      end

    rescue ActiveRecord::StaleObjectError
      reload
    end
  end

  def animator?(contributor)
    self.animator == contributor
  end

  private

  def animator_must_be_contributor
    if !animator.nil? and !contributors.include?(animator)
      errors.add(:animator, "must be a contributor")
    end
  end
end
