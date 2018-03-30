class AddUserIdToTimelines < ActiveRecord::Migration[5.0]
  def change
    add_reference :timelines, :user
  end
end
