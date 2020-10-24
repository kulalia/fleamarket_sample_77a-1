class CreateCategoryAncestries < ActiveRecord::Migration[5.2]
  def change
    create_table :category_ancestries do |t|
      t.string :name,     null: false
      t.string :ancestry
      t.timestamps
    end
    add_index :category_ancestries, :ancestry
  end
end
