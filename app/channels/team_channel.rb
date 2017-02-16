# TODO Write unit test for this when the action cable tests commits are available (https://github.com/rails/rails/pull/23211 and https://github.com/rspec/rspec-rails/issues/1606)
class TeamChannel < ApplicationCable::Channel
  def subscribed
    stream_from "team_channel_#{params[:team]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
