class CreateUserSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :user_skills do |t|
      t.string :skill
      t.string :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
