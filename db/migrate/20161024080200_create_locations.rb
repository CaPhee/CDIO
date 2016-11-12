class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :address
      t.references :area
      t.text :description
      t.text :details
      t.references :user
      t.integer :owner_id

      t.timestamps
    end

  end
end
