class Review < ActiveRecord::Base

  belongs_to :teacher, required: true
  belongs_to :user, required: true

end
