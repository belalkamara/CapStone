require 'date'

class Activity < ApplicationRecord
  belongs_to :type
  belongs_to :user

  enum status: { draft: 0, live: 1, ended: 2 }

  validates_presence_of :title, :miles, :status, :description, :start_date, :end_date, :user_id, :type_id

  mount_uploader :image, ActivityUploader

  scope :activities_by, ->(user) { where(user_id: user.id) }

  def self.draft
    where(status: 'draft')
  end

  def self.live
    where(status: 'live')
  end

  def self.by_position
    order("position ASC")
  end

  def self.recent
    order("created_at DESC")
  end
end