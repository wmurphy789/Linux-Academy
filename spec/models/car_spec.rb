require 'rails_helper'

RSpec.describe Car, type: :model do
	before :each do

	end

	context 'associations' do
		it { should have_many :transactions}
	end

	context 'validations' do
		it { should validate_presence_of :license_number}
	end

	context 'check_if_stolen' do
		it 'to return false' do
			car = Car.new(:license_number => "test", :car_type => 0)
	  		car.save

	  		expect(car.check_if_stolen).to eq(nil)
		end

		it 'to return false' do
			car = Car.new(:license_number => "testing", :car_type => 1)
	  		car.save

	  		expect(car.check_if_stolen).to eq(nil)
		end

		it 'to return true' do
			car = Car.new(:license_number => "1111111", :car_type => 1)
	  		car.save

	  		expect(car.check_if_stolen).to eq(["is stolen", "is stolen"])
		end
	end

	context 'check_if_car_or_truck' do
		it 'to return true car' do
			car = Car.new(:license_number => "test", :car_type => 0)
	  		car.save

	  		expect(car.check_if_car_or_truck).to eq(nil)
		end

		it 'to return true truck' do
			car = Car.new(:license_number => "testing", :car_type => 1)
	  		car.save

	  		expect(car.check_if_car_or_truck).to eq(nil)
		end

		it 'to return false' do
			car = Car.new(:license_number => "tested")
	  		car.save

	  		expect(car.check_if_car_or_truck).to eq(["has to be a truck or car", "has to be a truck or car"])
		end
	end
end
