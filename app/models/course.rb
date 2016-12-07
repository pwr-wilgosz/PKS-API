class Course < ApplicationRecord
	has_many :course_stop
	has_many :stop, through: :course_stop

	has_many :bus_course
	has_many :bus, through: :bus_course
end
