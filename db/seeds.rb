# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

puts "There are now #{Airport.count} rows in the airport table  "
