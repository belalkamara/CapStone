require "administrate/base_dashboard"

class BlogDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    topic: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    body: Field::Text,
    picture: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
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
