class CreateMuseums < ActiveRecord::Migration[7.0]
  def change
    create_table :museums do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.text :comment

      t.timestamps
    end
  end
end
