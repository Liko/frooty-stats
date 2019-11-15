class AddFsLeagueIdToCompetition < ActiveRecord::Migration[6.0]
  def change
    add_column :competitions, :fs_league_id, :integer
  end
end
