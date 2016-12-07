class Stop < ApplicationRecord
	has_many :course_stop
	has_many :course, through: :course_stop
end
