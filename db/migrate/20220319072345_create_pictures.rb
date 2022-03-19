class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.references :museum, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.string :image, null: false, limit: 100
      t.text :comment

      t.timestamps
    end
  end
end
