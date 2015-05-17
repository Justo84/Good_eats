class ReviewsController < ApplicationController

  def show

  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant_id = params[:restaurant_id]
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant_id

    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :user_id, :restaurant_id)
  end


end
