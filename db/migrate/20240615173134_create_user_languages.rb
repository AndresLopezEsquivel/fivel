class CreateUserLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :user_languages do |t|
      t.string :language
      t.string :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
