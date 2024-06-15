class CreateUserEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_educations do |t|
      t.string :country
      t.string :college
      t.string :title
      t.string :major
      t.date :year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
