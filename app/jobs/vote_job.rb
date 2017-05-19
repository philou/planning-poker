class VoteJob < ApplicationJob
  queue_as :default

  def perform(team)
    TeamChannel.vote_updated(team)
  end
end
