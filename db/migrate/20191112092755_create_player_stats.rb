class CreatePlayerStats < ActiveRecord::Migration[6.0]
  def change
    create_table :player_stats do |t|
      t.integer :player_id
      t.integer :appearances_overall
      t.integer :minutes_played_overall
      t.integer :goals_overall
      t.integer :clean_sheets_overall
      t.integer :conceded_overall
      t.integer :penalty_goals
      t.integer :penalty_misses
      t.integer :assists_overall
      t.integer :yellow_cards_overall
      t.integer :red_cards_overall

      t.timestamps
    end
  end
end
