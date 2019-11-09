class AddFsClubIdToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :fs_club_id, :integer
  end
end
