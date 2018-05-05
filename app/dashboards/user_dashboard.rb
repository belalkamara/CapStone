require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    blogs: Field::HasMany.with_options(searchable: false),
    activities: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true, seachable_field: 'email'),
    password: Field::String.with_options(searchable: false),
    encrypted_password: Field::String.with_options(searchable: false),
    name: Field::String.with_options(searchable: true, seachable_field: 'name'),
    reset_password_token: Field::String.with_options(searchable: false),
    reset_password_sent_at: Field::DateTime.with_options(searchable: false),
    remember_created_at: Field::DateTime.with_options(searchable: false),
    sign_in_count: Field::Number.with_options(searchable: false),
    current_sign_in_at: Field::DateTime.with_options(searchable: false),
    last_sign_in_at: Field::DateTime.with_options(searchable: false),
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    roles: Field::String.with_options(searchable: true, seachable_field: 'role'),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :blogs,
    :activities,
    :id,
    :name,
    :email,
    :roles,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :blogs,
    :activities,
    :id,
    :email,
    :encrypted_password,
    :name,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :created_at,
    :updated_at,
    :roles,
  ].freeze

  FORM_ATTRIBUTES = [
    :email,
    :password,
    :name,
    :roles,
  ].freeze

end
