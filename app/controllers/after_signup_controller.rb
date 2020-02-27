class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :personal, :username

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = params[:user].permit!
    render_wizard @user
  end

  def finish_wizard_path
    :pre_launch_reservation
  end
end
