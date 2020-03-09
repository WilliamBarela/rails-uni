class PeopleController < ApplicationController
  def index
    @faculty_members = FacultyMember.select('*').joins(:person)
    @grad_students = GraduateStudent.select('*').joins(:person)
  end
end
