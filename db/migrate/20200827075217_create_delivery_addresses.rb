class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :first_name_kana, null: false
      t.string :family_name, null: false
      t.string :family_name_kana, null: false
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end
