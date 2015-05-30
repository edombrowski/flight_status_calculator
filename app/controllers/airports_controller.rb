class AirportsController < ApplicationController
  def index
    @airports = Airport.all
  end

  def show
    @airport = Airport.find(params[:id])
  end

  def new
    @airport = Airport.new
  end

  def create
    @airport = Airport.new
    @airport.airport_code = params[:airport_code]
    @airport.airport_name = params[:airport_name]
    @airport.latitude = params[:latitude]
    @airport.longitude = params[:longitude]

    if @airport.save
      redirect_to "/airports", :notice => "Airport created successfully."
    else
      render 'new'
    end
  end

  def edit
    @airport = Airport.find(params[:id])
  end

  def update
    @airport = Airport.find(params[:id])

    @airport.airport_code = params[:airport_code]
    @airport.airport_name = params[:airport_name]
    @airport.latitude = params[:latitude]
    @airport.longitude = params[:longitude]

    if @airport.save
      redirect_to "/airports", :notice => "Airport updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @airport = Airport.find(params[:id])

    @airport.destroy

    redirect_to "/airports", :notice => "Airport deleted."
  end
end
