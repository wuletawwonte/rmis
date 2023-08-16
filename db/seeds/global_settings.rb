# frozen_string_literal: true

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
