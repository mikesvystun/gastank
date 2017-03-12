class RefillsController < ApplicationController
before_action :authenticate_user!
before_action :set_car, only: [:show, :edit, :update, :destroy, :create, :new]
before_action :set_refill, only: [:show, :edit, :update, :destroy]

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


  #GET /cars/1/refills/1/edit
  def edit
  end 


  #PATCH/PUT /cars/1/refills/1
  def update
    respond_to do |format|
      if @refill.update(refill_params)
        format.html { redirect_to @car, notice: 'Refill updated'}
      else
        format.html { render :edit }
      end
    end
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
    params.require(:refill).permit(:liters, :vartist, :probig, :full, :gasmark_id, :gasstation_id)
  end


end
