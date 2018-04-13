class AddStatusToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :status, :string
  end
end
