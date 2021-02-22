class MechanicsController < ApplicationController
  
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:add_ride])
    @mechanic.rides << ride
    redirect_to mechanic_path(@mechanic)
  end
end