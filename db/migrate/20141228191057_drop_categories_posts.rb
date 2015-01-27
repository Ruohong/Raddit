class DropCategoriesPosts < ActiveRecord::Migration
  def change
  	drop_table :categories_posts
  end
end
