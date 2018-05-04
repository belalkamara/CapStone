require "administrate/base_dashboard"

class TypeDashboard < Administrate::BaseDashboard
 
  ATTRIBUTE_TYPES = {
    activity: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
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
