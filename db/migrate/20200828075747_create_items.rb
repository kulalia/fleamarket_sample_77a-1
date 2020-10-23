class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.references :category, null: false
      t.string :detail, null: false
      t.string :brand
      t.integer :price, null: false
      t.string :item_status, null: false
      t.integer :prefecture_id, null: false
      t.integer :days_until_shipping, null: false
      t.string :shipping_fee, null: false
      t.integer :purchaser_id
      t.timestamps
    end
  end
end