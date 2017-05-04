def broadcast_vote_start()
  receive(:broadcast).and_call_original
    # TODO remove or replace this once we're done with the vote events refacto
    # .with(TeamChannel.channel_name(team.name),
    #       html: ApplicationController.render(partial: 'votes/started', locals: {vote: team.current_vote}),
    #       end_time: team.current_vote.ending)
end
