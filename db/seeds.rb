# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Car 1
Car.seed(:license_number) do |s|
  s.license_number = '123457'
  s.car_type = 0
end

#Car 2
Car.seed(:license_number) do |s|
  s.license_number = '123457a'
  s.car_type = 0
end

#Truck 1
Car.seed(:license_number) do |s|
  s.license_number = '123457b'
  s.car_type = 1
end

#Truck 2
Car.seed(:license_number) do |s|
  s.license_number = '123457c'
  s.car_type = 1
end

car = Car.find_by(license_number: '123457').id
truck = Car.find_by(license_number: '123457c').id

(0..5).each do |t|
	Transaction.create!(:car_id => car)
end

(0..3).each do |t|
	Transaction.create!(:car_id => truck, mud_in_bed: 1)
end

(0..3).each do |t|
	Transaction.create!(:car_id => truck, mud_in_bed: 0)
end
