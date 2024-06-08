class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :category
      t.string :delivery_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
