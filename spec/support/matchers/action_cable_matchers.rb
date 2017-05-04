def broadcast_vote_start()
  receive(:broadcast).and_call_original
    # .with(TeamChannel.channel_name(team.name),
    #       html: ApplicationController.render(partial: 'votes/started', locals: {vote: team.current_vote}),
    #       end_time: team.current_vote.ending)
end
