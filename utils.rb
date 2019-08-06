require 'Time'
require './constants'

def get_time_rand from = Time.now, to = Time.now + (60 * 60 * 10)
  Time.at(from + rand * (to.to_f - from.to_f))
end

def get_rand_type_load
  TYPE_LOAD[rand(TYPE_LOAD.length)]
end

def get_rand_load_sum
  rand(LOAD_SUM)
end

def can_drive_route(driver_allowed, route_cities)
  route_cities.each do |city_id|
    if !driver_allowed.include? city_id
      return false
    end
  end
  return true
end


