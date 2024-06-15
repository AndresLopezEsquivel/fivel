class CreateUserCertifications < ActiveRecord::Migration[7.1]
  def change
    create_table :user_certifications do |t|
      t.string :certification
      t.string :company
      t.date :year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
