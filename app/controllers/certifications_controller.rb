class CertificationsController < ApplicationController
  before_action :load_certification, only: [:edit, :update, :destroy]

  def create
    @certification = Certification.new(certification_params)

    if @certification.save
      redirect_to user_edit_bio_url(current_user), notice: "Certification added!"
    else
      render template: "users/edit_bio"
    end
  end

  def edit
  end

  def update
    # if !params[:certification][:cert_pic].nil?
    #   @user.cert_pic.attach(params[:user][:cert_pic])
    # end
    if @certification.update_attributes(certification_params)
      redirect_to user_edit_bio_url(current_user), notice: "Certification details updated!"
    else
      render template: "users/edit_bio"
    end
  end

  def destroy
    @certification.destroy
    redirect_to user_edit_bio_url(current_user), notice: "Certification deleted."
  end

  private

  def load_certification
    @certification = Certification.find(params[:id])
  end

  def certification_params
    params.require(:certification).permit(
      :trainer_id, :certification, :name, :level, :accreditor, :website_url, :description, :start_date, :end_date
    )
  end
end
