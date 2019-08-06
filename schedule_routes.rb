require './displayData'
require './populateDB'

##Call script to populate DB with random values
populateDB()

##This method assigns (route,(driver,vehicle)) with the first that commits the restrictions
##for each route takes the first vehicle that:
# has all the cities on a route as allowed
# the load type is equals for the vehicle and the route
# the routes total load is equal or less than the vehicle's capacity
# the drivers max stop is equal or less than the route's stops
def schedule
  routes = Route.all()
  vehicle_ids = []

  routes.each do |route|
    Vehicle.all().each do |vehicle|
      driver_allowed_cities = vehicle.driver.allowed_cities.map(&:id)
      route_cities = route.route_cities.map(&:id)
      can_drive = can_drive_route(driver_allowed_cities, route_cities)
      if vehicle_ids.include? vehicle || !can_drive
        break
      elsif route.load_type == vehicle.load_type && route.load_sum <= vehicle.capacity && vehicle.driver.max_stops <= route.stops_amount
        route.create_assignment(route: route, vehicle: vehicle)
        vehicle_ids.push(vehicle)
        break
      end
    end
  end
end

display_vehicles
display_routes
display_Drivers

schedule
display_assignment