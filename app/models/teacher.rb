class Teacher < ActiveRecord::Base

  has_many :reviews
  #belongs_to :category, required: true
  validates_presence_of :name
  validates_presence_of :postcode

  geocoded_by :full_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def full_address
    [city, postcode].join(', ')
  end

  def self.search(params)
  # teachers = Teacher.where(category_id: params[:category].to_i)
    teachers = Teacher.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    teachers = teachers.near(params[:location], 20) if params[:location].present?
    teachers
  end

end
