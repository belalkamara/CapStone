require "administrate/base_dashboard"

class ActivityDashboard < Administrate::BaseDashboard
 
  ATTRIBUTE_TYPES = {
    types: Field::HasMany,
    user: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    miles: Field::Number,
    image: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    status: Field::String.with_options(searchable: false),
    days: Field::Number,
    description: Field::Text,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
  }.freeze
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :title,
    :status,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :types,
    :user,
    :id,
    :title,
    :miles,
    :image,
    :created_at,
    :updated_at,
    :status,
    :days,
    :description,
    :start_date,
    :end_date,
  ].freeze

  FORM_ATTRIBUTES = [
    :types,
    :user,
    :title,
    :miles,
    :image,
    :status,
    :description,
    :start_date,
    :end_date,
  ].freeze
end
