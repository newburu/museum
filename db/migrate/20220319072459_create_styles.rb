class CreateStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :styles do |t|
      t.references :museum, null: false, foreign_key: true
      t.string :name, null: false, limit: 100
      t.text :css
      t.text :comment

      t.timestamps
    end
  end
end
