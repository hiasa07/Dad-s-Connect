class AddCategoryToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :category_id, :integer
  end
end
