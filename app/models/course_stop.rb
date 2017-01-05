class CourseStop < ApplicationRecord
  belongs_to :course
  belongs_to :stop
end
