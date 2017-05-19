class VoteJob < ApplicationJob
  queue_as :default

  def perform(team)
    TeamChannel.vote_started(team)
  end
end
