class AddCategoryIdToTodos < ActiveRecord::Migration
  def change
  	add_column :todos, :category_id, :integer
    add_index :todos, :category_id
  end
end
