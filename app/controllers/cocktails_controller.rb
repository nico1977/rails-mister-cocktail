class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    raise

    @cocktail = Cocktail.new(review_params)
    @cocktail.save
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
