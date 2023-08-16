# frozen_string_literal: true

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
