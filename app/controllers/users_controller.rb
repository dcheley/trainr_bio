class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :destroy]

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

  def load_user
    @user = User.find(params[:id])
  end
end
