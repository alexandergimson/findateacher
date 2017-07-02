class InitialSchema < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :description
      t.string :postcode
    end

    create_table :reviews do |t|
      t.string   :comment
      t.integer  :rating
    end

    create_table :categories do |t|
      t.string   :name
    end

  end
end
