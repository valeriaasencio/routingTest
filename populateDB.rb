require './model'
require './constants'
require './utils'

def populateDB
  ##Populate City with the list provided of Santiago RM comunas
  CITIES.each do |region, comunas|
    comunas.each { |comuna|
      City.create(region: region, name: comuna)
    }

    ##Generate random routes
    all_cities = City.where(region: 'RM')
    cities_number = all_cities.length
    ROUTE_NUMBER.times do |n|
      starting_time = get_time_rand
      ending_time = get_time_rand(starting_time)
      rand_route_cities_number = rand(cities_number)
      stops_amount = cities_number - rand_route_cities_number

      route = Route.create(
          starts_at: starting_time,
          ends_at: ending_time,
          load_type: get_rand_type_load,
          load_sum: get_rand_load_sum,
          stops_amount: stops_amount)

      rand_route_cities_number.times do |l|
        route.route_cities.create(city: all_cities[rand(cities_number) - 1])
      end

    end
    ##Generate Drivers && Vehicles
    drivers_number = 5
    drivers_number.times do |n|
      driver = Driver.create(name: "Pepe#{n}", phone: "123", email: "mail@route.cl", max_stops: rand(cities_number))
      driver.create_vehicle(capacity: get_rand_load_sum, load_type: get_rand_type_load)
      rand(cities_number - 5..cities_number).times do |n|
        driver.allowed_cities.create(city: all_cities[n])
      end
    end
  end
end


