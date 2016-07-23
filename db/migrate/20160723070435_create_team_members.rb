class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.text :name
      t.integer :team_id

      t.timestamps
    end
  end
end
