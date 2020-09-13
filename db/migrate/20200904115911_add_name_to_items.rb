class AddNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :user, foreign_key: true
    add_column :items, :name, :string, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :detail, :string, null: false
    add_column :items, :brand, :string
    add_column :items, :price, :integer, null: false
    add_column :items, :item_status, :string, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :days_until_shipping, :integer, null: false
    add_column :items, :shipping_fee, :string, null: false
    add_column :items, :sale_or_sold, :string, null: false
  end
end
