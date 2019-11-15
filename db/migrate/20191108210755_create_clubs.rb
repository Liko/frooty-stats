class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :shorthand
      t.integer :country_id
      t.string :image
      t.integer :founded
      t.integer :stadium_id

      t.timestamps
    end
  end
end
