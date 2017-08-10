class DosesController < ApplicationController
   before_action :find_dose, only: [:delete]
  def new
    @new_dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @new_dose = Dose.new(set_params)
    @new_dose.cocktail = @cocktail
    if @new_dose.save
      redirect_to cocktails_path
    else
      render "cocktails/show"
    end
  end

  def delete
    @dose.destroy
    @cocktail = @dose.cocktail
    redirect_to cocktail_path(@cocktail)
  end

 private

  def set_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
