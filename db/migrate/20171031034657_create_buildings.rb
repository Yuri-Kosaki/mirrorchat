class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string        :facility
      t.text          :explanation
      t.string        :access
      t.integer       :telephone_number, :limit => 12
      t.references    :user
      t.timestamps
    end
  end
end
