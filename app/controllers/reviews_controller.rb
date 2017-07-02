class ReviewsController <ApplicationController
  before_action :set_teacher
  before_action :authenticate_user!

  def new
    @review = Review.new(teacher: @teacher)
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.teacher = @teacher
    @review.save
    redirect_to @teacher
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
