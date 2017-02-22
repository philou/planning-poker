require 'rails_helper'

describe TeamChannel do

  it "broadcasts on specific teams" do
    allow(ActionCable.server).to receive(:broadcast).and_call_original
    daltons = Team.create(name: "Daltons")

    TeamChannel.broadcast(daltons, "Vote screwed !")

    expect(ActionCable.server).to have_received(:broadcast)
                                   .with(TeamChannel.channel_name("Daltons"), message: "Vote screwed !")
  end

  # TODO Write unit test for the subscription when the action cable tests commits are available (https://github.com/rails/rails/pull/23211 and https://github.com/rspec/rspec-rails/issues/1606)

end
