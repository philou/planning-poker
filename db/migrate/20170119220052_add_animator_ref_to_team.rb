class AddAnimatorRefToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :animator_id, :integer
    add_foreign_key :teams, :team_members, column: :animator_id
   end
end

# TODO gemserver through docker
