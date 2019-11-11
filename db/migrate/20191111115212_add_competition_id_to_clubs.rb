class AddCompetitionIdToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :competition_id, :integer
  end
end
