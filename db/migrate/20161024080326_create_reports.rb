class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :user
      t.text :description
      t.integer :report_id
      t.string :report_type
      t.boolean :checked
      t.boolean :is_critical

      t.timestamps
    end
  end
end
