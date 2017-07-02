class AddCategoryIndexToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_reference :teachers, :category, index: true
  end
end
