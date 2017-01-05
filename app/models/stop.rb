class Stop < ApplicationRecord
	validates :name, length: { minimum: 5 }

	has_many :course_stop, dependent: :destroy
	has_many :courses, through: :course_stop
end
