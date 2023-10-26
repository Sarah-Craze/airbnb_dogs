# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all

20.times do
  city = City.create(
    city_name: Faker::Address.city
  )

  dog = Dog.create(
    name: Faker::Name.first_name,
    city: city
  )

  dogsitter = Dogsitter.create(
    name: Faker::Name.first_name,
    city: city
  )

  Stroll.create(
    date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    dog: dog,
    dogsitter: dogsitter
  )
end

