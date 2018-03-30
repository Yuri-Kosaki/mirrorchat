class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text          :text
      t.string        :image
      t.references    :timeline
      t.references    :user
      t.timestamps
    end
  end
end
