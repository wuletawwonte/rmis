# frozen_string_literal: true

require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    avatar_attachment: Field::HasOne,
    avatar_blob: Field::HasOne,
    calls: Field::HasMany,
    color: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    members: Field::HasMany,
    middle_name: Field::String,
    full_name: Field::String,
    profile: Field::BelongsTo,
    proposals: Field::HasMany,
    remember_created_at: Field::DateTime,
    research_center: Field::BelongsTo,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    role: Field::String,
    sex: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    themes: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    full_name
    email
    role
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    avatar_attachment
    avatar_blob
    calls
    color
    email
    encrypted_password
    first_name
    last_name
    members
    middle_name
    profile
    proposals
    remember_created_at
    research_center
    reset_password_sent_at
    reset_password_token
    role
    sex
    themes
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    avatar_attachment
    avatar_blob
    calls
    color
    email
    encrypted_password
    first_name
    last_name
    members
    middle_name
    profile
    proposals
    remember_created_at
    research_center
    reset_password_sent_at
    reset_password_token
    role
    sex
    themes
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

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
