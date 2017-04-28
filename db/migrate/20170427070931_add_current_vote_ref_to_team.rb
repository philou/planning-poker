class AddCurrentVoteRefToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :current_vote_id, :integer
    add_foreign_key :teams, :votes, column: :current_vote_id
  end
end
