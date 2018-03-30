class CreateTimelines < ActiveRecord::Migration[5.0]
  def change
    create_table :timelines do |t|
      t.text           :text
      t.string         :image
      t.timestamps
    end
  end
end
