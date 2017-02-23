class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @reviews = Review.order_desc.paginate page: params[:page],
      per_page: Settings.review.number_item_in_page
  end

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def new
    if logged_in?
      @review = Review.new
    else
      @guest = Guest.new
      @review = @guest.build_review
    end
  end

  private
  def review_params
    params.require(:review).permit :content
  end
end
