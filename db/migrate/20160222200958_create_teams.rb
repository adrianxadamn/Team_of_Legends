class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location
      t.string :native_language
      t.string :members
      t.string :owner
      t.string :team_image
      t.date :established_on
      t.text :description
      t.string :team_abbreviation

      t.timestamps null: false
    end
  end
end
