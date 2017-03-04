class RefillsController < ApplicationController
before_action :authenticate_user!
before_action :set_car
# before_action :set_refill

  #GET /car/:id/refills/new
  def new
    @refill = Refill.new 
  end


  #POST /car/:id/refills
  def create
    @refill = Refill.new(refill_params)
    @refill.car_id = @car.id

  respond_to do |format|
    if @refill.save
      format.html { redirect_to @car, notice: "Refill added." }
    else 
      format.html { render :new } 
    end
  end  
  end

  private

  def set_car
     @car = current_user.cars.find(params[:car_id])
  end

#  def set_refill
#     @refill = Refill.find(params[:id])
#  end
   

  def refill_params
    params.require(:refill).permit(:liters, :vartist, :probig, :full)
  end


end
