class CreateRoommates < ActiveRecord::Migration[5.0]
  def change
    create_table :roommates do |t|
      t.references           :room
      t.references           :user
      t.timestamps
    end
  end
end
