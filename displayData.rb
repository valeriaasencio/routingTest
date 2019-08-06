require './model'

def display_routes
  puts "****"
  puts "**** ROUTES"
  Route.all().each do |route|
    puts route.inspect
  end
end

def display_assignment
  puts "****"
  puts "****"
  puts "**** Assignments"
  puts "ID Vehículo, ID Conductor, ID Ruta (Hora inicio - Hora fin)"
  Assignment.all().each do |assign|
    puts "#{assign.vehicle.id}, #{assign.vehicle.driver.id}, #{assign.route.id} (#{assign.route.starts_at} - #{assign.route.ends_at})"
  end
end

def display_vehicles
  puts "****"
  puts "**** Vehicles"
  Vehicle.all().each do |vehicle|
    puts vehicle.inspect
  end
end

def display_Drivers
  puts "****"
  puts "**** Drivers"
  Driver.all().each do |driver|
    puts driver.inspect
  end
end

