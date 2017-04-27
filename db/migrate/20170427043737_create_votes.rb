class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.datetime :ending
      t.references :team, foreign_key: true

      t.timestamps
    end
    add_index :votes, :ending
  end
end
