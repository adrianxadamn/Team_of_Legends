class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :native_language
      t.string :role
      t.string :tier_level
      t.date :born_on
      t.boolean :transportation
      t.string :ign
      t.string :location
      t.string :profile_image
      t.text :description
      t.references :team, index: true, foreign_key: true
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
