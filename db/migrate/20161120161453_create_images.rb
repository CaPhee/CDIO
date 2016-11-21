class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file_name
      t.integer :size
      t.references :post, index: true, foreign_key: true

      t.timestamps
    end
  end
end
