# frozen_string_literal: true

def create_admin
  User.create(
    first_name: "Wuletaw",
    middle_name: "Wonte",
    last_name: "Mitsa",
    email: SeedsHelper.user_email("wuletaw", "wonte"),
    password: "123456",
    role: "admin"
  )
end

@admin = create_admin
puts "wuletaw.wonte@amu.edu.et user account is ready"
