def broadcast_vote_update(team_name)
  receive(:broadcast)
    .with(TeamChannel.channel_name(team_name), {})
    .and_call_original
end

