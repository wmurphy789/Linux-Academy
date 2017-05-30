class Car < ActiveRecord::Base
  acts_as_paranoid

  has_many :transactions

  validate :check_if_stolen
  validate :check_if_car_or_truck
  validates :license_number, presence: true

  enum car_type: { car: 0, truck: 1 }

  # Check if the car is a truck or car
  def check_if_car_or_truck
    unless self.car? || self.truck?
      errors.add(:car_type, "has to be a truck or car")
    end
  end

  # Check if the car is stolen
  def check_if_stolen
    unless license_number != "1111111"
      errors.add(:license_number, "is stolen")
    end
  end

end