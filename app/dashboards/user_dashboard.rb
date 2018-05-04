require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    blogs: Field::HasMany,
    activities: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    password: Field::String,
    encrypted_password: Field::String,
    name: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    roles: Field::String,
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
