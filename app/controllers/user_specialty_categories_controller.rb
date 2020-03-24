class UserSpecialtyCategoriesController < ApplicationController
  def create
    @user_specialty_categories = UserSpecialtyCategory.new(user_id: params[:user_id], specialty_category_id: params[:specialty_category_id])
    if @user_specialty_categories.save
      flash[:success] = 'Added to specialty categories'
      redirect_to listing_path(params[:listing_id])
    else
      flash[:error] = "You can't add the same category twice!"
      redirect_to listing_path(params[:listing_id])
    end
  end

  def destroy
    @user_specialty_categories = UserSpecialtyCategory.find(params[:id])
    if @user_specialty_categories.destroy
      flash[:success] = 'Removed from specialty categories'
      redirect_to listing_path(params[:listing_id])
    else
      flash[:error] = 'Something went wrong'
      redirect_to listing_path(params[:listing_id])
    end
  end
end
