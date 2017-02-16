class TeamChannel < ApplicationCable::Channel
  def subscribed
    stream_from "team_channel_#{params[:team]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
