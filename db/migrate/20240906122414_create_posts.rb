class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :color
      t.string :species
      t.string :breed
      t.string :last_seen_location
      t.date :date_reported
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
