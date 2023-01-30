# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

User.create(
  first_name: 'Wuletaw',
  middle_name: 'Wonte',
  last_name: 'Mitsa',
  email: 'wuletawwonte@amu.edu.et',
  password: '123456'
)

puts "wuletawwonte@amu.edu.et user account is ready"

5.times do |_index|
  @first_name = Faker::Name.first_name
  @middle_name = Faker::Name.middle_name
  @last_name = Faker::Name.last_name

  User.create(
    first_name: @first_name,
    middle_name: @middle_name,
    last_name: @last_name,
    email: "#{@first_name}.#{@last_name}@gmail.com",
    password: '123456'
  )
end
