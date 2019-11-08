class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :shorthand
      t.integer :country_id
      t.integer :birthday
      t.integer :position_id
      t.integer :club_id

      t.timestamps
    end
  end
end
