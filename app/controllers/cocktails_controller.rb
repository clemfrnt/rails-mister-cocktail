class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @new_cocktail = Cocktail.new
  end

  def create
    @new_cocktail = Cocktail.new(set_params)
    @new_cocktail.save
    redirect_to cocktails_path
  end

  private

  def set_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
