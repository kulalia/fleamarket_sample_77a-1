class RenameCategoryAncestryToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_table :category_ancestries, :categories
  end
end
