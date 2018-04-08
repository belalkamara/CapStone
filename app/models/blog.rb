class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :picture, :topic_id

  belongs_to :topic

  after_initialize :set_defaults

  def set_defaults
    self.picture ||= "http://via.placeholder.com/400x300"
    self.topic_id ||= Topic.last.id
  end
end