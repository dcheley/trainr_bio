class UserSpecialtyCategoriesController < ApplicationController
  def create
    @user_specialty_categories = UserSpecialtyCategory.new(user_id: params[:user_id], specialty_category_id: params[:specialty_category_id])

    if @user_specialty_categories.save
      flash[:notice] = 'Added to specialty categories'
      redirect_to user_edit_bio_url(params[:user_id])
    else
      flash[:error] = "You can't add the same category twice!"
      redirect_to user_edit_bio_url(params[:user_id])
    end
  end

  def destroy
    @user_specialty_categories = UserSpecialtyCategory.find(params[:id])

    if @user_specialty_categories.destroy
      flash[:notice] = 'Removed from specialty categories'
      redirect_to user_edit_bio_url(params[:user_id])
    else
      flash[:error] = 'Something went wrong'
      redirect_to user_edit_bio_url(params[:user_id])
    end
  end
end
