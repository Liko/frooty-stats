class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :home_id
      t.integer :away_id
      t.integer :home_goal_count
      t.integer :away_goal_count
      t.integer :stadium_id
      t.integer :date
      t.integer :attendance

      t.timestamps
    end
  end
end
