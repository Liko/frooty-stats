class CreateClubStats < ActiveRecord::Migration[6.0]
  def change
    create_table :club_stats do |t|
      t.integer :club_id
      t.integer :seasonGoals_overall
      t.integer :seasonConceded_overall
      t.integer :seasonWinsNum_overall
      t.integer :seasonDrawsNum_overall
      t.integer :seasonLossesNum_overall
      t.integer :seasonMatchesPlayed_overall
      t.integer :seasonCS_overall
      t.integer :leaguePosition_overall
      t.integer :average_attendance_home
      t.integer :cornersTotal_overall
      t.integer :shotsTotal_overall
      t.integer :shotsOnTargetTotal_overall
      t.integer :possessionAVG_overall
      t.integer :foulsTotal_overall
      t.integer :offsidesTotal_overall


      t.timestamps
    end
  end
end
