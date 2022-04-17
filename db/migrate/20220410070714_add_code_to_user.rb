class AddCodeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :code, :string, after: :uid
  end
end
