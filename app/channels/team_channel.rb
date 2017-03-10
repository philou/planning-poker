class TeamChannel < ApplicationCable::Channel

  def subscribed
    # TODO use stream_to instead
    stream_from self.class.channel_name(params[:team_name])
  end

  def self.vote_started(team, message)
    ActionCable.server.broadcast(channel_name(team.name), message: message)
  end

  def self.channel_name(team_name)
    "team_channel_#{team_name}"
  end

end
