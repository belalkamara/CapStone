require "administrate/base_dashboard"

class TypeDashboard < Administrate::BaseDashboard
 
  ATTRIBUTE_TYPES = {
    activity: Field::BelongsTo.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    name: Field::String.with_options(searchable: true, seachable_field: 'name'),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :name,
    :created_at,
  ].freeze
  SHOW_PAGE_ATTRIBUTES = [
    :activity,
    :id,
    :name,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :activity,
    :name,
  ].freeze
end
