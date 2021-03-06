class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :load_friendly_id, only: [:bio, :edit_bio, :my_trainers]

  def show
    @events = @user.trainer_events.order("date ASC")
    @bio = @user.bio
    @events = @user.trainer_events.limit(5).order("date ASC")
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
    if !params[:user][:avatar].nil?
      @user.avatar.attach(params[:user][:avatar])
    end

    if !params[:user][:cover].nil?
      @user.cover.attach(params[:user][:cover])
    end

    if !params[:user][:bio_pic].nil?
      @user.bio_pic.attach(params[:user][:bio_pic])
    end

    if @user.update_attributes(user_params)
      redirect_to user_url(@user), notice: "Account updated!"
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
    SendGridService::Email.new(
      'trainrbio@gmail.com',
      'trainrbio@gmail.com',
      "#{current_user.email} sent a message from the prelaunch site!",
      'text/plain',
      params[:comment],
    ).send_email

    # UserMailer.landing_email(body).deliver_later

    redirect_to root_url, notice: "Thanks for the feedback!"
  end

  def forgot_password
  end

  def verification
  end

  def profile
    @events = @user.trainer_events.limit(5).order("date ASC")
  end

  def bio
    @milestones = @user.milestones.order("year ASC")
    @certifications = @user.certifications.order("start_date ASC")
    @practices = UserPracticeCategory.where(user_id: @user.id).includes(:practice_category).sort_by { |p| p.practice_category.name }
    @specialties = UserSpecialtyCategory.where(user_id: @user.id).includes(:specialty_category).sort_by { |s| s.specialty_category.name }
  end

  def edit_bio
    @user = current_user
    @mypractices = UserPracticeCategory.where(user_id: @user.id).includes(:practice_category).sort_by { |p| p.practice_category.name }
    @myspecialties = UserSpecialtyCategory.where(user_id: @user.id).includes(:specialty_category).sort_by { |s| s.specialty_category.name }
    @milestones = @user.milestones.order("year ASC")
    @milestone = Milestone.new
    @certifications = @user.certifications.order("start_date ASC")
    @certification = Certification.new
    @practices = PracticeCategory.all.order("name ASC")
    @specialties = SpecialtyCategory.all.order("name ASC")
  end

  def manage_users
    @users = User.all.order("email ASC")
  end

  private

  def load_user
    @user = User.friendly.find(params[:id])
  end

  def load_friendly_id
    @user = User.friendly.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(
      :email, :username, :phone, :location, :first_name, :last_name, :img_url,
      :instagram_url, :facebook_url, :website_url, :tik_tok_url, :description,
      :password, :password_confirmation, :role, :latitude, :longitude, :bio,
      :headline
    )
  end
end
