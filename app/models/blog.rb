class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title, :body, :topic_id, :user_id

  scope :blogs_by, ->(user) { where(user_id: user.id) }

  belongs_to :topic
  belongs_to :user

  has_many :comments, dependent: :destroy

  after_initialize :set_defaults

  def set_defaults
    self.topic_id ||= Topic.last.id
    self.user_id ||= User.last.id
  end
end