class DropTableCategoriesPosts < ActiveRecord::Migration
  def change
  	drop_table :table_categories_posts
  end
end
