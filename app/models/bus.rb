class Bus < ApplicationRecord
  validates :registration_number, uniqueness: true, presence: true
  validates :brand, presence: true
  validates :spaces, presence: true

  has_many :issues, dependent: :destroy
  has_many :bus_course, dependent: :destroy
  has_many :course, through: :bus_course
end
