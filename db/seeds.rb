# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts '========== SEEDING ... =========='

User.destroy_all
GlobalSetting.destroy_all
ResearchCenter.destroy_all
Call.destroy_all

# Get email of a user with amu.edu.et domain
def user_email(fname, lname)
  "#{fname}.#{lname}@amu.edu.et"
end

# A pool to choose gender from.
GENDERS = %i[Male Female].freeze

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

@admin = create_admin
puts 'wuletaw.wonte@amu.edu.et user account is ready'

def create_user(role = 'researcher')
  random_gender = GENDERS.sample
  @first_name = if random_gender == :Male
                  Faker::Name.male_first_name
                else
                  Faker::Name.female_first_name
                end

  @middle_name = Faker::Name.middle_name
  @last_name = Faker::Name.last_name

  User.create(
    first_name: @first_name,
    middle_name: @middle_name,
    last_name: @last_name,
    email: user_email(@first_name, @middle_name),
    password: '123456',
    sex: random_gender,
    role:
  )
end

def create_researchers
  5.times do
    create_user
  end
end

create_researchers
puts '5 researcher accounts created and ready'

def generate_global_setting
  GlobalSetting.create(
    allowed_co_per_year: 2,
    allowed_pi_per_year: 2,
    date_format: 'dd-mm-yyyy',
    default_password: '123456',
    minimum_password_length: 6,
    university_city: 'Arba Minch',
    university_country: 'ET',
    university_email: 'corcom@amu.edu.et',
    university_facebook: 'https://www.facebook.com/arbaminch_university',
    university_name: 'Arba Minch University',
    university_phone: '+251468810243',
    university_telegram: 'telegram.app/amu',
    university_twitter: 'https://twitter.com/amu',
    university_website: 'https://www.amu.edu.et'
  )
end

generate_global_setting
puts 'Default global settings value generated'

def create_research_center
  random_gender = GENDERS.sample
  @first_name = if random_gender == :Male
                  Faker::Name.male_first_name
                else
                  Faker::Name.female_first_name
                end

  @middle_name = Faker::Name.middle_name
  @last_name = Faker::Name.last_name

  research_center = ResearchCenter.create(
    name: 'Centre for Livestock and Fishery Research Center'
  )
  research_center.build_user(
    first_name: @first_name,
    middle_name: @middle_name,
    last_name: @last_name,
    email: user_email(@first_name, @middle_name),
    password: '123456',
    sex: random_gender,
    role: 'research_coordinator'
  )
  research_center.save
end

create_research_center
puts 'Created research center with its associated coordinator account'

def create_research_calls
  5.times do
    rc = Call.new(
      title: Faker::Lorem.sentence,
      published: true,
      deadline: Faker::Date.forward(days: 30),
      user: @admin
    )
    rc.content = ActionText::Content.new(body: Faker::Lorem.paragraph)
    rc.save
  end
end

create_research_calls
puts '5 research calls created'

puts '========== SEEDING DONE =========='
