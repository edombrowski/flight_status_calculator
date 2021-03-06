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
    @program = Program.find(current_user.program_id)
    @eligible_flights = Flight.where({ :user_id => current_user.id, :program_id => current_user.program_id })
    @miles_flown = @eligible_flights.sum(:miles_flown)
    @t1_remaining = (@program.t1_threshold - @miles_flown)
    @t1_completion = @miles_flown/@program.t1_threshold.to_f*100
    @t2_remaining = (@program.t2_threshold - @miles_flown)
    @t2_completion = @miles_flown/@program.t2_threshold.to_f*100
    @t3_remaining = (@program.t3_threshold - @miles_flown)
    @t3_completion = @miles_flown/@program.t3_threshold.to_f*100
    if @program.t4_threshold != nil
      @t4_remaining = (@program.t4_threshold - @miles_flown)
      @t4_completion = @miles_flown/@program.t4_threshold.to_f*100
    else
      @t4_remaining = 0
    end
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
    @flight.round_trip = params[:round_trip]

    if @flight.save
      redirect_to "/flights", :notice => "Flight created successfully."
    else
      render 'new'
    end
  end

  def edit
    @flight = Flight.find(params[:id])
    if @flight.round_trip = "true"
      @round_trip = "checked"
    else
      @round_trip = nil
    end
  end

  def update
    @flight = Flight.find(params[:id])
    @flight.user_id = params[:user_id]
    @flight.program_id = params[:program_id]
    @flight.destination_airport_id = params[:destination_airport_id]
    @flight.origin_airport_id = params[:origin_airport_id]
    @flight.miles_flown = params[:miles_flown]
    @flight.round_trip = params[:round_trip]

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
