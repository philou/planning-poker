class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.text :name

      t.timestamps
    end
  end
end
