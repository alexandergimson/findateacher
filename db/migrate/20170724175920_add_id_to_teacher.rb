class AddIdToTeacher < ActiveRecord::Migration[5.1]
  def change
  add_column :teachers, :category_id, :integer
end
end
