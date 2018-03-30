class AddIntroductionToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :introduction, :text
  end
end
