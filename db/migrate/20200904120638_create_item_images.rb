class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.references :item, foreign_key: true, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
