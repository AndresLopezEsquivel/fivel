class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.string :status
      t.string :date
      t.float :price
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
