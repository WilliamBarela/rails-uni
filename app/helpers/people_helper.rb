module PeopleHelper
  def display_name(person)
    name = "#{person.honorific} #{person.first_name} #{person.last_name}"
    (person.suffix.nil?) ? name : "#{name}, #{person.suffix}"
  end
end
