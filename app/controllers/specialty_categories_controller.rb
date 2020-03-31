class SpecialtyCategoriesController < ApplicationController
  before_action :load_specialty, only: [:edit, :update, :destroy]

  def create
    @specialty = SpecialtyCategory.new(specialty_category_params)

    if @specialty.save
      redirect_to specialty_categories_url, notice: "Specialty saved!"
    else
      render :index
    end
  end

  def index
    @specialty = SpecialtyCategory.new
    @specialties = SpecialtyCategory.all.order("name ASC")
  end

  def edit
  end

  def update
    if @specialty.update_attributes(specialty_category_params)
      redirect_to specialty_categories_url, notice: "Specialty updated!"
    else
      render :edit
    end
  end

  def destroy
    @specialty.destroy
    redirect_to specialty_categories_url, notice: "Specialty deleted."
  end

  private

  def specialty_category_params
    params.require(:specialty_category).permit(
      :name
    )
  end

  def load_specialty
    @specialty = SpecialtyCategory.find(params[:id])
  end
end
