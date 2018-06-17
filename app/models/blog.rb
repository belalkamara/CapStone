class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title, :body, :topic_id, :user_id

  mount_uploader :picture, BlogUploader

  scope :blogs_by, ->(user) { where(user_id: user.id) }

  belongs_to :topic
  belongs_to :user

  has_many :comments, dependent: :destroy

  def self.recent
    order("created_at DESC")
  end
end