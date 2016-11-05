class Bus < ApplicationRecord
  validates :registration_number, uniqueness: true, presence: true
  validates :brand, presence: true
  validates :spaces, presence: true

  has_many :issues
end

