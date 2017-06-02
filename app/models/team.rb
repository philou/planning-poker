class Team < ApplicationRecord
  has_many :contributors
  belongs_to :animator, class_name: "Contributor", optional: true
  validate :animator_must_be_contributor

  has_many :votes
  belongs_to :current_vote, class_name: "Vote", optional: true
  validate :current_vote_must_be_a_vote

  def animator?(contributor)
    self.animator == contributor
  end

  def if_needed_pick_animator(contributor)
    begin
      if self.animator.nil?
        self.update(animator: contributor)
      end

    rescue ActiveRecord::StaleObjectError
      reload
    end
  end

  def currently_voting?
    !current_vote.nil? && current_vote.running?
  end

  def start_vote(ending)
    vote = self.votes.create(ending: ending)
    self.current_vote = vote
    self.save
    vote
  end

  private

  def animator_must_be_contributor
    if !animator.nil? and !contributors.include?(animator)
      errors.add(:animator, "must be a contributor")
    end
  end

  def current_vote_must_be_a_vote
    if !current_vote.nil? and !votes.include?(current_vote)
      errors.add(:current_vote, "must be part of the team's votes")
    end
  end
end
