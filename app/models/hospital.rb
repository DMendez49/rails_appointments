class Hospital < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patient, through: :appointments

  def full_name
    "#{self.full_name} #{self.last_name}"
  end
end