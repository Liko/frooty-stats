class AddFsClubIdToStadia < ActiveRecord::Migration[6.0]
  def change
    add_column :stadia, :fs_club_id, :integer
  end
end
