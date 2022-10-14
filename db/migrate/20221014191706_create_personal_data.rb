class CreatePersonalData < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_data do |t|
      t.string :nick_name
      t.string :phone_number, null: false
      t.string :email_address, null: false
      t.string :last_name, limit: 50, null: false
      t.string :first_name, limit: 25, null: false

      t.timestamps
    end
  end
end
