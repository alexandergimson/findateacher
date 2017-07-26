class RemoveColumns < ActiveRecord::Migration[5.1]
  def self.up
  remove_column :teachers, :category_id
end
end
