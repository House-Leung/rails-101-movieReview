class ReviewsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]
  before_action :find_movie_and_check_favorite_permission

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = review.find(params[:id])
    @review = Review.update(review_params)
    @review.movie = @movie
    @review.user = current_user

    if @review.save
      redirect_to account_reviews_path, notice: "电影评论修改成功！"
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
      redirect_to account_reviews_path, alert: "已删除电影评论！"
  end

  private

  def find_movie_and_check_favorite_permission
    @movie = Movie.find(params[:movie_id])
    if !current_user.is_member_of?(@movie)
      redirect_to movie_path(@movie), alert: "你需要收藏该电影后才能发表评论！"
    end
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
