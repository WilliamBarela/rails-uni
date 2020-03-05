# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-US'

department_members = 200
percent_faculty = 0.23

faculty = (department_members * percent_faculty).floor


department_members.times { 
  Person.new(
    honorific: ['Mr.', 'Mrs.', 'Ms.', 'Dr.'].sample,
    last_name: Faker::Name.unique.last_name,
    middle_name: Faker::Name.unique.name,
    first_name: Faker::Name.unique.first_name,
    suffix: ['Jr.', 'II', 'III', 'IV'].tap{|a| 100.times{ a << nil }}.sample,
    gender: ['male', 'female', 'non-binary'].sample,
    ttus_email: Faker::Internet.email,
    ttus_phone: "806-834-#{Faker::PhoneNumber.subscriber_number(length: 4)}"
  ).save
}

Person.all[0..faculty].each{ |person|
  FacultyMember.create(
    current_title: ['Professor', 'Associate Professor', 'Assistant Professor', 'Research Assistant Professsor', 'Instructor'].sample,
    auxiliary_roles: ['Some Committee Chairperson', 'Some Committee Associate Chairperson'].tap{|a| 50.times{ a << nil}}.sample,
    objectives_statement: Faker::Lorem.paragraph_by_chars(number: 160),
    research_interests_summary: Faker::Lorem.paragraph_by_chars(number: 512),
    role_start_date: nil,
    role_termination_date: nil,
    termination_reason: nil,
    person_id: person.id
  )
}

Person.all[faculty + 1..department_members].each{ |person|
  GraduateStudent.create(
    current_program: ['Biology','Biology','Microbiology','Microbiology'].sample,
    degree_sought: ['MS','PhD'].sample,
    auxiliary_roles: ['TA', 'RA'].tap{|a| 100.times{ a << nil}}.sample,
    expected_graduation_year: nil,
    expected_graduation_semester: nil,
    objectives_statement: Faker::Lorem.paragraph_by_chars(number: 160),
    research_interests_summary: Faker::Lorem.paragraph_by_chars(number: 512),
    role_start_date: nil,
    role_termination_date: nil,
    termination_reason: nil,
    person_id: person.id
  )
}
