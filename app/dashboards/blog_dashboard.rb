require "administrate/base_dashboard"

class BlogDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    topic: Field::BelongsTo.with_options(searchable: false),
    user: Field::BelongsTo.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    title: Field::String.with_options(searchable: true, seachable_field: 'title'),
    body: Field::Text.with_options(searchable: false),
    picture: Field::Text.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    status: Field::String.with_options(searchable: false),
  }.freeze

  
  COLLECTION_ATTRIBUTES = [
    :topic,
    :user,
    :id,
    :title,
  ].freeze

   SHOW_PAGE_ATTRIBUTES = [
    :topic,
    :user,
    :id,
    :title,
    :body,
    :picture,
    :created_at,
    :updated_at,
    :status,
  ].freeze

  FORM_ATTRIBUTES = [
    :topic,
    :user,
    :title,
    :body,
    :picture,
    :status,
  ].freeze

end
