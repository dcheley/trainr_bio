class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def index
    if !params[:search].blank?
      @users = User.search(params[:search]).order("first_name ASC")
    # elsif !params[:category].blank?
    #   @users = users.where(category: params[:category]).order("category ASC")
    else
      @users = User.all.order("first_name ASC")
    end
  end

  def edit
    if current_user != @user
      redirect_to :index, notice: "Not authorized."
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "Account updated!"
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :username, :phone, :location, :first_name, :last_name, :img_url,
      :instragram_url, :facebook_url, :website_url, :tik_tok_url, :description,
      :password, :password_confirmation
    )
  end
end
