class OffersController < ApplicationController
  before_action :load_offer, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.friendly.find(params[:user_id])
    @offers = @user.offers
  end

  def show
    @user = current_user
  end

  def manage_offers
    @user = current_user
    @offer = @user.offers #need id of specific offer
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    attach_image

    if @offer.save
      redirect_to user_offers_path(@offer.trainer_id), notice: "Offer created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    attach_image

    if @offer.update_attributes(offer_params)
      redirect_to user_offers_url(@offer.trainer_id), notice: "Offer details updated!"
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to user_offers_url(@offer.trainer_id), notice: "Offer deleted."
  end

  private

  def load_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(
      :title, :description, :duration, :start_time, :date, :location, :latitude,
      :longitude, :trainer_id, :cost, :booking_url, :status, :other
    )
  end

  def attach_image
    if !params[:offer][:avatar].nil?
      @offer.avatar.attach(params[:offer][:avatar])
    end
  end
end
