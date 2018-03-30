class AddMessageIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :group
    add_reference :comments, :message
  end
end
