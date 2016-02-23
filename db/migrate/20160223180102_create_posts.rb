class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.string :author_image

      t.timestamps null: false
    end
  end
end
