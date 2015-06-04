class Flight < ActiveRecord::Base

validates :origin_airport, :destination_airport, :program, :presence => true

  after_validation :update_miles_flown
  def update_miles_flown
    self.miles_flown = Haversine.distance(self.origin_airport.latitude, self.origin_airport.longitude, self.destination_airport.latitude, self.destination_airport.longitude).to_mi
  end

  belongs_to :origin_airport , :class_name => "Airport", :foreign_key => "origin_airport_id"
  belongs_to :destination_airport , :class_name => "Airport", :foreign_key => "destination_airport_id"
  belongs_to :user
  belongs_to :program

end
