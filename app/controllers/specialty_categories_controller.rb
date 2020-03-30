class SpecialtyCategoriesController < ApplicationController
  before_action :load_practice, only: [:edit, :update, :destroy]

  def new
    @specialty = SpecialtyCategory.new
  end

  def create
    @specialty = SpecialtyCategory.new(practice_category_params)

    if @specialty.save
      redirect_to practice_categories_url, notice: "Specialty saved!"
    else
      render :new
    end
  end

  def index
    @specialties = SpecialtyCategory.all.order("name ASC")
  end

  def edit
  end

  def update
    if @specialty.update_attributes(practice_category_params)
      redirect_to practice_categories_url, notice: "Specialty updated!"
    else
      render :edit
    end
  end

  def destroy
    @specialty.destroy
    redirect_to practice_categories_url, notice: "Specialty deleted."
  end

  private

  def specialty_category_params
    params.require(:specialty_category).permit(
      :name
    )
  end
end
