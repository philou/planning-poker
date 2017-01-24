class AddLockVersionToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :lock_version, :integer
  end
end
