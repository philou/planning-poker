def broadcast_vote_start(team_name, message)
  receive(:broadcast)
    .with(TeamChannel.channel_name(team_name), message: message)
    .and_call_original
end
