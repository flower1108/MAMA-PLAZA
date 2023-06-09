class AddChildInformationToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :child_information, :text
  end
end
