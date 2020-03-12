class UsersController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def show
    @events = @user.trainer_events
  end

  def index
    if !params[:search].blank?
      @users = User.search(params[:search]).order("first_name ASC")
      @studios = Studio.search(params[:search]).order("name ASC")
    # elsif !params[:category].blank?
    #   @users = users.where(category: params[:category]).order("category ASC")
    else
      @users = User.where(role: 1).order("first_name ASC")
      @studios = Studio.all.order("name ASC")
    end
  end

  def edit
    @studios = Studio.all.order("name ASC")
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

  def home
  end

  def welcome
  end

  def my_trainers
  end

  def landing_email
    body = params[:comment]

    from = SendGrid::Email.new(email: 'trainrbio@gmail.com')
    to = SendGrid::Email.new(email: 'trainrbio@gmail.com')
    subject ="#{current_user.email} sent a message from the prelaunch site!"
    content = SendGrid::Content.new(type: 'text/plain', value: body)
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    # UserMailer.landing_email(body).deliver_later

    redirect_to :pre_launch_reservation, notice: "Thanks for the feedback!"
  end

  def forgot_password
  end

  def verification
  end

  def profile
    @user = current_user
    @events = @user.trainer_events.limit(6).order("date ASC")
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :username, :phone, :location, :first_name, :last_name, :img_url,
      :instragram_url, :facebook_url, :website_url, :tik_tok_url, :description,
      :password, :password_confirmation, :role
    )
  end
end
