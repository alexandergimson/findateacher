class RemoveCategoryFromTeachers < ActiveRecord::Migration[5.1]
  def change
    remove_column :teachers, :category_id
  end
end
