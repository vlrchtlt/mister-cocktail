class DosesController < ApplicationController
  before_action :dose_params, only: [:create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path
    else
      render new
    end
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end
end
