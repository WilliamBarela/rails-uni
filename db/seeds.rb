# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-US'

20.times { 
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
