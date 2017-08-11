class DosesController < ApplicationController
   before_action :find_cocktail, only: [:new, :create]

  def new
    @new_dose = Dose.new
  end

  def create

    @new_dose = Dose.new(set_params)
    @new_dose.cocktail = @cocktail
    if @new_dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

 private

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
