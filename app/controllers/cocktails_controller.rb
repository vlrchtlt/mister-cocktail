class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show, :delete ]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    # @dose.cocktails = @cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def delete
    @cocktail.destroy
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :picture)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
