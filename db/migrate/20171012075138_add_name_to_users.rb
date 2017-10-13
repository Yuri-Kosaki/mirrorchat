class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :hobby, :text
    add_column :users, :place, :text
    add_column :users, :year, :integer
  end
end
