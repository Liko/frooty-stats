class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :scorer_id
      t.integer :team_id
      t.integer :assister_id
      t.integer :match_id
      t.integer :minute

      t.timestamps
    end
  end
end
