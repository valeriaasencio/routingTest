require 'active_record'


ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: ':memory:'
)

ActiveRecord::Schema.define do

  #Create Table Drivers
  create_table :drivers, :force => true do |t|
    t.string :name
    t.string :phone
    t.string :email
    t.integer :max_stops
    t.references :vehicle
  end

  create_table :vehicles, :force => true do |t|
    t.integer :capacity
    t.string :load_type
    t.references :driver
  end

  create_table :routes, :force => true do |t|
    t.string :starts_at
    t.string :ends_at
    t.string :load_type
    t.integer :load_sum
    t.references :route_cities
    t.integer :stops_amount
  end

  create_table :assignments, :force => true do |t|
    t.references :vehicle
    t.references :route
  end

  create_table :cities, :force => true do |t|
    t.string :name
    t.string :region
  end

  create_table :route_cities, :force => true do |t|
    t.references :route
    t.references :city
  end

  create_table :allowed_cities, :force => true do |t|
    t.references :driver
    t.references :city
  end

end