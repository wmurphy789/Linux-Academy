require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do

	before :each do
      @car = Car.new(:license_number => "test_car", :car_type => 0)
	  @car.save

	  @truck = Car.new(:license_number => "test_truck", :car_type => 1)
	  @truck.save
	end

	describe "GET #index" do
		it "returns http success" do
			get :index
	  		expect(response).to have_http_status(:success)
		end

		it "returns 4" do
			(0..3).each do |t|
				post = Transaction.new(:car_id => @car.id)
	      		post.save
			end

			get :index
	  		expect(assigns[:transactions].size).to eq(4)
		end

		it "returns 10" do
			(0..12).each do |t|
				post = Transaction.new(:car_id => @car.id)
	      		post.save
			end

			get :index
	  		expect(assigns[:transactions].size).to eq(10)
		end
	end

	describe "POST #create" do
		it "increases transaction by 1" do
	      expect {
			post :create, transaction: {car: {license_number: "test", car_type: "car"}}, format: :js
		  }.to change(Transaction, :count).by(1)
	    end

	    it "increases transaction by 1" do
	      expect {
			post :create, transaction: {car: {license_number: "test", car_type: "truck"}}, format: :js
		  }.to change(Transaction, :count).by(1)
	    end

	    it "increases transaction by 0" do
	      expect {
			post :create, transaction: {car: {car_type: "truck"}}, format: :js
		  }.to change(Transaction, :count).by(0)
	    end

	    it "increases transaction by 0" do
	      expect {
			post :create, transaction: {car: {license_number: "test"}}, format: :js
		  }.to change(Transaction, :count).by(0)
	    end

	    it "increases transaction by 1" do
	      expect {
			post :create, transaction: {mud_in_bed: 0, bed_down: 0, car: {license_number: "test", car_type: "truck"}}, format: :js
		  }.to change(Transaction, :count).by(1)
	    end

	    it "increases transaction by 1" do
	      expect {
			post :create, transaction: {mud_in_bed: 1, bed_down: 0, car: {license_number: "test", car_type: "truck"}}, format: :js
		  }.to change(Transaction, :count).by(1)
	    end

	    it "increases transaction by 0" do
	      expect {
			post :create, transaction: {mud_in_bed: 0, bed_down: 1, car: {license_number: "test", car_type: "truck"}}, format: :js
		  }.to change(Transaction, :count).by(0)
	    end

	    it "increases transaction by 0" do
	      expect {
			post :create, transaction: {mud_in_bed: 1, bed_down: 1, car: {license_number: "test", car_type: "truck"}}, format: :js
		  }.to change(Transaction, :count).by(0)
	    end
	end
end
