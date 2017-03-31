class RenameTeamMembersToContributors < ActiveRecord::Migration[5.1]
  def change
    rename_table :team_members, :contributors
  end
end
