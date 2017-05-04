class TeamChannel < ApplicationCable::Channel

  def subscribed
    # TODO use stream_to instead
    stream_from self.class.channel_name(params[:team_name])
  end

  def self.vote_started(team)
    # TODO could we send a full page refresh instead ?
    ActionCable.server.broadcast(channel_name(team.name),
                                 html: ApplicationController.render( partial: 'votes/started', locals: {vote: team.current_vote } ),
                                 end_time: team.current_vote.ending.utc.strftime("%Y-%m-%d %H:%M:%SZ"))
  end

  def self.channel_name(team_name)
    "team_channel_#{team_name}"
  end

end
