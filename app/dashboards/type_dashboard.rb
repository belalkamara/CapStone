require "administrate/base_dashboard"

class TypeDashboard < Administrate::BaseDashboard
 
  ATTRIBUTE_TYPES = {
    activities: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    title: Field::String.with_options(searchable: true, seachable_field: 'title'),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :activities,
    :id,
    :title,
    :created_at,
  ].freeze
  SHOW_PAGE_ATTRIBUTES = [
    :activities,
    :id,
    :title,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :activities,
    :title,
  ].freeze
end
