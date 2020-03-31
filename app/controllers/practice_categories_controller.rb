class PracticeCategoriesController < ApplicationController
  before_action :load_practice, only: [:edit, :update, :destroy]

  def create
    @practice = PracticeCategory.new(practice_category_params)

    if @practice.save
      redirect_to practice_categories_url, notice: "Practice saved!"
    else
      render :index
    end
  end

  def index
    @practice = PracticeCategory.new
    @practices = PracticeCategory.all.order("name ASC")
  end

  def edit
  end

  def update
    if @practice.update_attributes(practice_category_params)
      redirect_to practice_categories_url, notice: "Practice updated!"
    else
      render :edit
    end
  end

  def destroy
    @practice.destroy
    redirect_to practice_categories_url, notice: "Practice deleted."
  end

  private

  def load_practice
    @practice = PracticeCategory.find(params[:id])
  end

  def practice_category_params
    params.require(:practice_category).permit(
      :name
    )
  end
end
