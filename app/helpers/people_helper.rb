module PeopleHelper
  def display_name(person)
    name = "#{person.honorific} #{person.first_name} #{person.last_name}"
    (person.suffix.nil?) ? name : "#{name}, #{person.suffix}"
  end

  def display_degree_program(grad_student)
    "#{grad_student.degree_sought} in #{grad_student.current_program}"
  end
end
