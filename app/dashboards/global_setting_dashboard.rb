# frozen_string_literal: true

require "administrate/base_dashboard"

class GlobalSettingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    allowed_co_per_year: Field::Number,
    allowed_pi_per_year: Field::Number,
    date_format: Field::String,
    default_password: Field::String,
    minimum_password_length: Field::Number,
    university_city: Field::String,
    university_country: Field::String,
    university_email: Field::String,
    university_facebook: Field::String,
    university_name: Field::String,
    university_phone: Field::String,
    university_telegram: Field::String,
    university_twitter: Field::String,
    university_website: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    allowed_co_per_year
    allowed_pi_per_year
    date_format
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    allowed_co_per_year
    allowed_pi_per_year
    date_format
    default_password
    minimum_password_length
    university_city
    university_country
    university_email
    university_facebook
    university_name
    university_phone
    university_telegram
    university_twitter
    university_website
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    allowed_co_per_year
    allowed_pi_per_year
    date_format
    default_password
    minimum_password_length
    university_city
    university_country
    university_email
    university_facebook
    university_name
    university_phone
    university_telegram
    university_twitter
    university_website
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how global settings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(global_setting)
  #   "GlobalSetting ##{global_setting.id}"
  # end
end
