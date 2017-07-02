class AddCityToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :city, :string
  end
end
