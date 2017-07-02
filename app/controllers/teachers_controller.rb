class TeachersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :is_admin?, only: [:edit, :update, :destroy]

  def index
    #visitor_latitude = request.location.latitude
    #visitor_longitude = request.location.longitude
    visitor_latitude = 51.5906222
    visitor_longitude = -0.1435051
    @teachers = Teacher.near([visitor_latitude, visitor_longitude], 20)
  end

  def new
    @teacher = Teacher.new
  end

  def create
      @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher
    else
      flash[:danger] = @teacher.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    @reviews = Review.where(teacher_id: @teacher)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def search
    @teachers = Teacher.search(params)
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)
    redirect_to @teacher
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to root_path
  end

  private
    def teacher_params
      params.require(:teacher).permit(:name, :postcode, :description, :category_id, :image)
    end

    def is_admin?
      if !current_user.try(:admin?)
        flash[:danger] = "You are not authorised to do that"
        redirect_to root_path
      end
    end

end
