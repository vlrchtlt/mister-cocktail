class DosesController < ApplicationController
  # before_action :set_cocktail

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path
    else
      render "cocktails/show"
    end
  end

  def destroy
  end

  private
  # def set_cocktail
  #   @cocktail = Cocktail.find(params[:id])
  # end
  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end
end
