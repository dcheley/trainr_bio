class OffersController < ApplicationController
  before_action :load_offer, only: [:edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @offers = @user.offers
  end
    @offer = Offer.find(params[:user_id])
  def show

  end

  def manage_offers
    @user = current_user
    @offers = @user.offers
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to user_path(@offer.trainer_id), notice: "Offer created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @offer.update_attributes(offer_params)
      redirect_to user_url(@offer.trainer_id), notice: "Offer details updated!"
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to user_url(@offer.trainer_id), notice: "Offer deleted."
  end

  private

  def load_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(
      :title, :description, :duration, :start_time, :date, :location,
      :trainer_id, :cost, :booking_url, :status, :other
    )
  end
end
