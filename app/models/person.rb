class Person < ApplicationRecord
  has_many :faculty_members
  has_many :graduate_students
end
