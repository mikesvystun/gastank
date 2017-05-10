class RefillsController < ApplicationController
before_action :authenticate_user!
before_action :set_car, only: [:show, :edit, :update, :destroy, :create, :new]
before_action :set_refill, only: [:show, :edit, :update, :destroy]

  def new
    @refill = Refill.new 
  end


  def create
    @refill = Refill.new(refill_params)
    @refill.car_id = @car.id

    if @refill.save
      redirect_to @car, notice: "Refill added."
    else 
      render :new, notice: 'Something went wrong, please try again.' 
    end
  end


  def edit
  end 


  def update
    if @refill.update(refill_params)
      redirect_to @car, notice: 'Refill updated'
    else
      render :edit, notice: 'Something went wrong, please try again.' 
      end
  end
  
  def destroy
    @refill.destroy
    redirect_to car_path(@car) 
  end

  private

  def set_car
     @car = current_user.cars.find(params[:car_id])
     @refills = @car.refills
  end

  def set_refill
     @refill = @refills.find(params[:id])
  end

  def refill_params
    params.require(:refill).permit(:liters, :vartist, :probig, :full, :gasmark_id, :gasstation_id, :stan_id, :comment)
  end


end
