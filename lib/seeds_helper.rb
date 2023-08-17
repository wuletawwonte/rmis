# frozen_string_literal: true

module SeedsHelper
  class << self
    GENDERS = %i[Male Female].freeze
    Person = Struct.new(:first_name, :middle_name, :last_name, :gender, :email)

    # Get email of a user with amu.edu.et domain
    def user_email(fname, lname)
      "#{fname}.#{lname}@amu.edu.et"
    end

    # Generate a random gender
    def random_gender
      GENDERS.sample
    end

    def random_person
      person = Person.new
      person.gender = random_gender
      person.first_name = if person.gender == :Male
                            Faker::Name.male_first_name
                          else
                            Faker::Name.female_first_name
                          end

      person.middle_name = Faker::Name.middle_name
      person.last_name = Faker::Name.last_name
      person.email = user_email(person.first_name, person.last_name)
      person
    end
  end
end
