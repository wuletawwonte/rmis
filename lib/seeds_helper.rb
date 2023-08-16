# frozen_string_literal: true

module SeedsHelper
  class << self
    GENDERS = %i[Male Female].freeze

    # Get email of a user with amu.edu.et domain
    def user_email(fname, lname)
      "#{fname}.#{lname}@amu.edu.et"
    end

    # Generate a random gender
    def random_gender
      GENDERS.sample
    end
  end
end
