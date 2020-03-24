class UserPracticeCategoriesController < ApplicationController
  def create
    @user_practice_categories = UserPracticeCategory.new(user_id: params[:user_id], practice_category_id: params[:practice_category_id])
    if @user_practice_categories.save
      flash[:success] = 'Added to specialty categories'
      redirect_to listing_path(params[:listing_id])
    else
      flash[:error] = "You can't add the same category twice!"
      redirect_to listing_path(params[:listing_id])
    end
  end

  def destroy
    @user_practice_categories = UserPracticeCategory.find(params[:id])
    if @user_practice_categories.destroy
      flash[:success] = 'Removed from specialty categories'
      redirect_to listing_path(params[:listing_id])
    else
      flash[:error] = 'Something went wrong'
      redirect_to listing_path(params[:listing_id])
    end
  end
end
