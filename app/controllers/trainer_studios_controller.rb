class TrainerStudiosController < ApplicationController
  def create
    @trainer_studio = TrainerStudioService::Build.call(params)
    if @trainer_studio.save
      flash[:notice] = 'Added Trainr to studio'
      redirect_to edit_studio_url(params[:studio_id])
    else
      flash[:alert] = "You can't register for the same studio twice!"
      redirect_to edit_studio_url(params[:studio_id])
    end
  end

  def destroy
    @trainer_studio = TrainerStudio.find(params[:id])
    @studio = @trainer_studio.studio
    if @trainer_studio.destroy
      flash[:notice] = 'Removed from studio'
      redirect_to edit_studio_url(@studio)
    else
      flash[:alert] = 'Something went wrong'
      redirect_to edit_studio_url(@studio)
    end
  end
end
