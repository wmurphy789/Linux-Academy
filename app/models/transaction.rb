class Transaction < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :car

  validate :check_required_fields

  accepts_nested_attributes_for :car, allow_destroy: true

  after_create :create_total

  # Check if all fields are filled out
  def check_required_fields
  	if self.bed_down && self.car_id
      errors.add(:bed_down, ", can't wash truck") if self.car.truck?
    end
  end

  # Add up total for transaction
  def create_total
    if self.car_id
    	if self.car.car?
        # TODO: Move amount to config or in db
    		amount = 5
    		amount = amount * 0.5 if Transaction.where(car_id: self.car_id).count == 2
    		self.total = amount
    		self.save
    	elsif self.car.truck?
    		amount = 10
    		amount = amount + 2 if self.mud_in_bed
    		amount = amount * 0.5 if Transaction.where(car_id: self.car_id).count == 2
    		self.total = amount
    		self.save
    	end
    end
  end

end