class DosesController < ApplicationController
before_action :set_cocktail, only: [:new, :create]

  def new
    # @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to @cocktail
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    # @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)

  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])

  end
  def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
  end

end
