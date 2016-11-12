class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :user
      t.integer :followed_id
      t.integer :follow_type

      t.timestamps
    end
  end
end
