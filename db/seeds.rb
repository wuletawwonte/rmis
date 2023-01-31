# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

# Get email of a user with amu.edu.et domain
def user_email(fname, lname)
  "#{fname}.#{lname}@amu.edu.et"
end

# A pool to choose gender from. 
GENDERS = [:Male, :Female]

def create_admin
  User.create(
    first_name: 'Wuletaw',
    middle_name: 'Wonte',
    last_name: 'Mitsa',
    email: user_email('wuletaw', 'wonte'),
    password: '123456',
    role: 'admin'
  )
end

create_admin
puts "wuletaw.wonte@amu.edu.et user account is ready"

def create_researchers
  5.times do |_index|
    random_gender = GENDERS.sample
    if random_gender == :Male
      @first_name = Faker::Name.male_first_name
    else
      @first_name = Faker::Name.female_first_name
    end

    @middle_name = Faker::Name.middle_name
    @last_name = Faker::Name.last_name

    User.create(
      first_name: @first_name,
      middle_name: @middle_name,
      last_name: @last_name,
      email: user_email(@first_name, @middle_name),
      password: '123456',
      sex: random_gender
    )
  end
end

create_researchers
puts "5 researcher accounts created and ready"