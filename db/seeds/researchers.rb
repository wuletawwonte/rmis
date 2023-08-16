# frozen_string_literal: true

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
