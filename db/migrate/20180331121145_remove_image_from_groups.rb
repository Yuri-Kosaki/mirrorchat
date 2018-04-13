class RemoveImageFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :image, :string
  end
end
