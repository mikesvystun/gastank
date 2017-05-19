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
    @refill.overliters = params[:overliters].to_d

    unless params[:overliters].empty?
    @next_refill = Refill.new(refill_params)
    @next_refill.liters = @refill.overliters
    @next_refill.vartist = @refill.overliters_vartist
    @next_refill.full = false
    @next_refill.probig = nil
    @next_refill.car_id = @car.id
    end

    @refill.vartist -= @refill.overliters_vartist
    @refill.liters -= @refill.overliters

    if @refill.save 
      @next_refill.save unless @next_refill.nil? 
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
    params.require(:refill).permit(:liters, :vartist, :probig, :full, :gasmark_id, :gasstation_id, :stan_id, :comment, :overliters)
  end


end
