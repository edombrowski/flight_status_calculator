# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Program.create(t3_threshold: "100000", t3_name: "Executive Platinum", t2_threshold: "50000", t2_name: "Platinum", t1_threshold: "25000", t1_name: "Gold", program_type: "flight", program_name: "American Airlines AAdvantage", t4_name: "")

Program.create(t3_threshold: "75000", t3_name: "Premier Platinum", t2_threshold: "50000", t2_name: "Premier Gold", t1_threshold: "25000", t1_name: "Premier Silver", program_type: "flight", program_name: "Unite MileagePlus", t4_name: "Premier 1K", t4_threshold: "100000")

Program.create(t3_threshold: "75000", t3_name: "Premier Platinum", t2_threshold: "50000", t2_name: "Premier Gold", t1_threshold: "25000", t1_name: "Premier Silver", program_type: "flight", program_name: "Unite MileagePlus", t4_name: "Premier 1K", t4_threshold: "100000")

User.create(email: "erik@example.com", password: "12341234", program_id: "1")
User.create(email: "katie@Examples.com", password: "12341234", program_id: "1")
User.create(email: "test@Examples.com", password: "12341234", program_id: "1")
User.create(email: "erik.dombrowski@gmail.com", password: "12341234", program_id: "1")

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'airports.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  puts row.to_hash
  t = Airport.new
  t.airport_code = row['airport_code']
  t.airport_name = row['airport_name']
  t.latitude = row['latitude']
  t.longitude = row['longitude']
  t.save
puts "#{t.airport_code}, #{t.airport_name} saved"
end

puts "There are now #{Airport.count} rows in the airport table"
