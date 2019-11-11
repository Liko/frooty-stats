class CreateGoalMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_matches do |t|
      t.integer :goal_id
      t.integer :match_id

      t.timestamps
    end
  end
end
