class DosesController < ApplicationController
  before_action :find_dose, only: [:delete]
  def new
    @new_dose = Dose.new
  end

  def create
  @new_dose = Dose.new(set_params)
  @dose.cocktail = @cocktail
  @dose.ingredient = @ingredient
  end

  def delete
    @dose.destroy
    redirect_to cocktails_path
  end

 private

  def set_params
    params.require(:dose).permit(:description)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
