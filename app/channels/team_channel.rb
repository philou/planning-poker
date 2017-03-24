class TeamChannel < ApplicationCable::Channel

  def subscribed
    # TODO use stream_to instead
    stream_from self.class.channel_name(params[:team_name])
  end

  def self.vote_started(team, end_time)
    # TODO could we send a full page refresh instead ?
    ActionCable.server.broadcast(channel_name(team.name),
                                 html: ApplicationController.render( partial: 'votes/started'),
                                 end_time: end_time.utc.strftime("%Y-%m-%d %H:%M:%SZ"))
  end

  def self.channel_name(team_name)
    "team_channel_#{team_name}"
  end

end
