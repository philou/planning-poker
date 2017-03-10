class TeamChannel < ApplicationCable::Channel

  def subscribed
    # TODO use stream_to instead
    stream_from self.class.channel_name(params[:team_name])
  end

  def self.vote_started(team, end_time)
    ActionCable.server.broadcast(channel_name(team.name), message: "Vote Started", end_time: end_time.utc.strftime("%Y-%m-%d %H:%M:%S"))
  end

  def self.channel_name(team_name)
    "team_channel_#{team_name}"
  end

end
