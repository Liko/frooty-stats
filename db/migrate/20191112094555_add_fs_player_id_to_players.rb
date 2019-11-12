class AddFsPlayerIdToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :fs_player_id, :integer
  end
end
