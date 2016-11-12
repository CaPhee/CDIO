class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :posts
      t.text :comment
      t.integer :like
      t.text :like_details
      t.integer :dislike
      t.text :dislike_details

      t.timestamps
    end

    add_foreign_key :comments, :posts, column: :posts_id, primary_key: "id", on_delete: :cascade
    add_foreign_key :comments, :users, column: :user_id, primary_key: "id", on_delete: :cascade
  end
end
