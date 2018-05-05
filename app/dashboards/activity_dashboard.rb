require "administrate/base_dashboard"

class ActivityDashboard < Administrate::BaseDashboard
 
  ATTRIBUTE_TYPES = {
    types: Field::HasMany.with_options(searchable: false),
    user: Field::BelongsTo.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    title: Field::String.with_options(searchable: true, seachable_field: 'title'),
    miles: Field::Number.with_options(searchable: false),
    image: Field::Text.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    status: Field::String.with_options(searchable: true, seachable_field: 'status'),
    days: Field::Number.with_options(searchable: false),
    description: Field::Text.with_options(searchable: false),
    start_date: Field::DateTime.with_options(searchable: false),
    end_date: Field::DateTime.with_options(searchable: false),
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
