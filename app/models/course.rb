class Course < ApplicationRecord
	validates :name, length: { minimum: 5 }
	
	has_many :course_stop, dependent: :destroy
	has_many :stops, through: :course_stop

	has_many :bus_course, dependent: :destroy
	has_many :buses, through: :bus_course
end
