class TrainerStudiosController < ApplicationController
  def create
    @trainer_studio = TrainerStudioService::Build.call(params)
    if @trainer_studio.save
      flash[:success] = 'Added to studio'
      redirect_to studio_url(params[:studio_id])
    else
      flash[:error] = "You can't register for the same studio twice!"
      redirect_to studio_url(params[:studio_id])
    end
  end

  def destroy
    @trainer_studio = TrainerStudio.find(params[:id])
    if @trainer_studio.destroy
      flash[:success] = 'Removed from studio'
      redirect_to studio_url(params[:studio_id])
    else
      flash[:error] = 'Something went wrong'
      redirect_to studio_url(params[:studio_id])
    end
  end
end
