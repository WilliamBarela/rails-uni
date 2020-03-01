class GraduateAdvisorship < ApplicationRecord
  belongs_to :faculty_member
  belongs_to :graduate_student
end
