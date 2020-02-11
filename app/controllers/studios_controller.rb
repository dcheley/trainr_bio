class StudiosController < ApplicationController
  before_action :load_studio, only: [:show, :edit, :destroy]

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
end
