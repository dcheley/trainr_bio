class UserStudiosController < ApplicationController
  def create
    @user_studio = UserStudioService::Build.call(params)
    if @user_studio.save
      flash[:success] = 'Added to favorites'
      redirect_to listing_path(params[:listing_id])
    else
      flash[:error] = "You can't favorite the same listing twice!"
      redirect_to listing_path(params[:listing_id])
    end
  end

  def destroy
    @user_studio = UserStudio.find(params[:id])
    if @user_studio.destroy
      flash[:success] = 'Removed from favorites'
      redirect_to listing_path(params[:listing_id])
    else
      flash[:error] = 'Something went wrong'
      redirect_to listing_path(params[:listing_id])
    end
  end
end
