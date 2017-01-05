class BusCourse < ApplicationRecord
  belongs_to :bus
  belongs_to :course
end
