class Bus < ApplicationRecord
  validates :registration_number, uniqueness: true, presence: true
  validates :brand, presence: true
  validates :spaces, presence: true

  has_many :issues
  has_many :bus_course
  has_many :course, through: :bus_course
end