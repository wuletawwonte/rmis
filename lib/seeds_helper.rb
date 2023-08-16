# frozen_string_literal: true

module SeedsHelper
  class << self
    # Get email of a user with amu.edu.et domain
    def user_email(fname, lname)
      "#{fname}.#{lname}@amu.edu.et"
    end
  end
end
