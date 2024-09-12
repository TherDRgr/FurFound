class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :color
      t.string :breed
      t.string :species
      t.references :user, null: false, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
