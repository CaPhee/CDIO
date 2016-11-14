class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.text :comment
      t.integer :like
      t.text :like_details
      t.integer :dislike
      t.text :dislike_details

      t.timestamps
    end
  end
end
