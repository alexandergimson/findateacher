class AddDescriptionIndexToTeachers < ActiveRecord::Migration[5.1]
  def change
     add_column :teachers, :description, :string
  end
end
