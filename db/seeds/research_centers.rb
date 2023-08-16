# frozen_string_literal: true

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
