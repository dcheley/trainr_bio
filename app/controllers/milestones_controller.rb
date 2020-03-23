class MilestonesController < ApplicationController
  before_action :load_milestone, only: [:edit, :update, :destroy]

  def new
    @milestone = Milestone.new
  end

  def create
    @milestone = Milestone.new(offer_params)

    if @milestone.save
      redirect_to edit_bio_url, notice: "Milestone created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @milestone.update_attributes(milestone_params)
      redirect_to edit_bio_url, notice: "Milestone details updated!"
    else
      render :edit
    end
  end

  def destroy
    @milestone.destroy
    redirect_to edit_bio_url, notice: "Milestone deleted."
  end

  private

  def load_milestone
    @milestone = Milestone.find(params[:trainer_id])
  end

  def milestone_params
    params.require(:milestone).permit(
      :trainer_id, :milestone, :year, :month
    )
  end
end
