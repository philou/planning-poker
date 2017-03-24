def broadcast_vote_start(team_name, end_time)
  receive(:broadcast)
    .with(TeamChannel.channel_name(team_name),
          html: ApplicationController.render(partial: 'votes/started'),
          end_time: end_time)
    .and_call_original
end
