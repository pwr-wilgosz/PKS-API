class BusCourse < ApplicationRecord
  belongs_to :bus, dependent: :destroy
  belongs_to :course, dependent: :destroy
end
