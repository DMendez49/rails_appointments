
class Patient < ApplicationRecord
  #Associations
  has_many :appointments
  has_many :hospitals, through: :appointments

  #instance method
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
