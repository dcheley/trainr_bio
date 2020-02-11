class StudiosController < ApplicationController
  before_action :load_studio, only: [:show, :edit, :update, :destroy]

  def new
    @studio = Studio.new
  end

  def create

  end

  def show

  end

  def index

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def load_studio
    @user = Studio.find(params[:id])
  end

  def studio_params
    params.require(:user).permit(:name, :phone, :location, :img_url, :website_url)
  end
end
