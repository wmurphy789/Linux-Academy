require 'rails_helper'

RSpec.describe Transaction, type: :model do
	before :each do
      @car = Car.new(:license_number => "test_car", :car_type => 0)
	  @car.save

	  @truck = Car.new(:license_number => "test_truck", :car_type => 1)
	  @truck.save
	end

    context 'associations' do
		it { should belong_to :car}
	end

	context 'check_required_fields' do
		it 'return true' do
			transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 0, bed_down: 0)
	  		transaction.save

	  		expect(transaction.check_required_fields).to eq(nil)
		end

		it 'return false' do
			transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 0, bed_down: 1)
	  		transaction.save

	  		expect(transaction.check_required_fields).to eq([", can't wash truck",", can't wash truck"])
		end
	end

	context 'create_total' do
		it 'sum car, total 5' do
			transaction = Transaction.new(:car_id => @car.id)
	  		transaction.save
	  		transaction.create_total

	  		expect(transaction.total).to eq(5)
		end

		it 'sum car, total 2.5' do
			transaction = Transaction.new(:car_id => @car.id)
	  		transaction.save
	  		transaction = Transaction.new(:car_id => @car.id)
	  		transaction.save
	  		transaction.create_total

	  		expect(transaction.total).to eq(2.5)
		end

		it 'sum truck, total 10' do
			transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 0, bed_down: 0)
	  		transaction.save
	  		transaction.create_total

	  		expect(transaction.total).to eq(10)
		end

		it 'sum truck, total 12' do
			transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 1, bed_down: 0)
	  		transaction.save
	  		transaction.create_total

	  		expect(transaction.total).to eq(12)
		end

		it 'sum truck, total 5' do
			transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 0, bed_down: 0)
	  		transaction.save
	  		transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 0, bed_down: 0)
	  		transaction.save
	  		transaction.create_total

	  		expect(transaction.total).to eq(5)
		end

		it 'sum truck, total 6' do
			transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 1, bed_down: 0)
	  		transaction.save
	  		transaction = Transaction.new(:car_id => @truck.id, mud_in_bed: 1, bed_down: 0)
	  		transaction.save
	  		transaction.create_total

	  		expect(transaction.total).to eq(6)
		end

		it 'return nil' do
			transaction = Transaction.new( mud_in_bed: 1, bed_down: 0)
	  		transaction.save

	  		expect(transaction.create_total).to eq(nil)
		end
	end
	
end
