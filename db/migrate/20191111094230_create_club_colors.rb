class CreateClubColors < ActiveRecord::Migration[6.0]
  def change
    create_table :club_colors do |t|
      t.integer :club_id
      t.integer :color_id

      t.timestamps
    end
  end
end
