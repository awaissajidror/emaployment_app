class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :personal_data, :users
  end
end
