class RemoveImageFromTimeline < ActiveRecord::Migration[5.0]
  def change
    remove_column :timelines, :image, :string
  end
end
