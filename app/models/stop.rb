class Stop < ApplicationRecord
	has_many :course_stop, dependent: :destroy
	has_many :course, through: :course_stop
end
