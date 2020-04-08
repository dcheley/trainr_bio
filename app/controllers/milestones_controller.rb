class MilestonesController < ApplicationController
  before_action :load_milestone, only: [:edit, :update, :destroy]

  def create
    @milestone = Milestone.new(milestone_params)

    if @milestone.save
      redirect_to user_edit_bio_url(current_user), notice: "Milestone created!"
    else
      render template: "users/edit_bio"
    end
  end

  def edit
  end

  def update
    if @milestone.update_attributes(milestone_params)
      redirect_to user_edit_bio_url(current_user), notice: "Milestone details updated!"
    else
      render template: "users/edit_bio"
    end
  end

  def destroy
    @milestone.destroy
    redirect_to user_edit_bio_url(current_user), notice: "Milestone deleted."
  end

  private

  def load_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(
      :trainer_id, :milestone, :year, :month
    )
  end
end
