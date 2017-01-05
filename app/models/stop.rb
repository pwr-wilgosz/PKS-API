class Stop < ApplicationRecord
	has_many :course_stop, dependent: :destroy
	has_many :courses, through: :course_stop
end
