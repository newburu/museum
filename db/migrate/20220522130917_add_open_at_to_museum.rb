class AddOpenAtToMuseum < ActiveRecord::Migration[7.0]
  def change
    add_column :museums, :open_start_at, :date, after: :name
    add_column :museums, :open_end_at, :date, after: :open_start_at
  end
end
