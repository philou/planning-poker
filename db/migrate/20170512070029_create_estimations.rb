class CreateEstimations < ActiveRecord::Migration[5.1]
  def change
    create_table :estimations do |t|
      t.references :contributor, foreign_key: true
      t.references :vote, foreign_key: true
      t.integer :story_points

      t.timestamps
    end
  end
end
