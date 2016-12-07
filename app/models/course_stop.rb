class CourseStop < ApplicationRecord
  belongs_to :course, dependent: :destroy
  belongs_to :stop, dependent: :destroy
end
