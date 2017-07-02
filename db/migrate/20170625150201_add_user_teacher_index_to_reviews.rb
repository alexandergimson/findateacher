class AddUserTeacherIndexToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :teacher, index: true
    add_reference :reviews, :user, index: true
  end
end
