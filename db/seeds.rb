
#SEEDING THE DATA IMPORTING  RESTAURANTES.CSV FILE
require 'csv'

csv_restaurants = File.read(Rails.root.join('db/restaurantes.csv'))
restaurantes = CSV.parse(csv_restaurants, :headers => true, :encoding => 'ISO-8859-1')
restaurantes.each do |row|
    Restaurant.create(
        idRestaurant: row['idRestaurant'],
        rating: row['rating'],
        name: row['name'],
        site: row['site'],
        email: row['email'],
        phone: row['phone'],
        street: row['street'],
        city: row['city'],
        state: row['state'],
        lat: row['lat'],
        lng: row['lng'],
        coordinates: "POINT (#{row['lng']} #{row['lat']})" 
    )
end
