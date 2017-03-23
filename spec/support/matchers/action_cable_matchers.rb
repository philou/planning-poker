def broadcast_vote_start(team_name, end_time)
  receive(:broadcast)
    .with(TeamChannel.channel_name(team_name), html: include("Vote Started"), end_time: end_time)
    .and_call_original
end
