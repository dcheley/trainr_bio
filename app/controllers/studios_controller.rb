class StudiosController < ApplicationController
  before_action :load_studio, only: [:show, :edit, :update, :destroy]

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)

    if @studio.save
      session[:studio_id] = @studio.id
      redirect_to studios_path(@studio), notice: "Studio created!"
    else
      render :new
    end
  end

  def show
  end

  def index
    @studios = Studio.all
  end

  def edit
    @trainers = User.where(role: 1).order("first_name ASC")
  end

  def update
    if @studio.update_attributes(studio_params)
      redirect_to studio_path(@studio), notice: "Studio details updated!"
    else
      render :edit
    end
  end

  def destroy
    @studio.destroy
    redirect_to studios_path, notice: "Studio deleted!"
  end

  private

  def load_studio
    @studio = Studio.find(params[:id])
  end

  def studio_params
    params.require(:studio).permit(:name, :phone, :location, :img_url, :website_url)
  end
end
