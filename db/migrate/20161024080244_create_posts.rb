class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user
      t.references :location
      t.integer :views
      t.integer :like
      t.text :like_details
      t.integer :dislike
      t.text :dislike_details

      t.timestamps
    end
  end
end
