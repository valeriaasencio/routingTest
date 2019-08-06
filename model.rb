require './schema'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Driver < ApplicationRecord
  belongs_to :vehicle
  has_many :allowed_cities
end

class Vehicle < ApplicationRecord
  has_one :driver
  has_one :assignment

end

class Route < ApplicationRecord
  has_many :route_cities
  has_one :assignment
end

class City < ApplicationRecord
  has_many :route_cities
end

class Assignment < ApplicationRecord
  belongs_to :route
  belongs_to :vehicle
end

class RouteCity < ApplicationRecord
  belongs_to :route
  belongs_to :city
end

class AllowedCity < ApplicationRecord
  belongs_to :driver
  belongs_to :city
end