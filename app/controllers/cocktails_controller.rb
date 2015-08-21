class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show, :delete ]
  before_action :cocktail_params, only: [ :create ]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render new
    end
  end

  def delete
    @cocktail.destroy
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
