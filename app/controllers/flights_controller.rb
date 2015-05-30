class FlightsController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:update, :destroy, :show, :edit]

  def ensure_current_user_is_owner
    @flight = Flight.find(params[:id])
    if @flight.user_id != current_user.id
      redirect_to root_url, :alert => "Nice Try"
    end
  end

  def index
    @flights = Flight.where({ :user_id => current_user.id })
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new
    @flight.user_id = params[:user_id]
    @flight.program_id = params[:program_id]
    @flight.destination_airport_id = params[:destination_airport_id]
    @flight.origin_airport_id = params[:origin_airport_id]
    @flight.miles_flown = params[:miles_flown]

    if @flight.save
      redirect_to "/flights", :notice => "Flight created successfully."
    else
      render 'new'
    end
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])

    @flight.user_id = params[:user_id]
    @flight.program_id = params[:program_id]
    @flight.destination_airport_id = params[:destination_airport_id]
    @flight.origin_airport_id = params[:origin_airport_id]
    @flight.miles_flown = params[:miles_flown]

    if @flight.save
      redirect_to "/flights", :notice => "Flight updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @flight = Flight.find(params[:id])

    @flight.destroy

    redirect_to "/flights", :notice => "Flight deleted."
  end
end
