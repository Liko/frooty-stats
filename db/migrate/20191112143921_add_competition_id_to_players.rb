class AddCompetitionIdToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :competition_id, :integer
  end
end
