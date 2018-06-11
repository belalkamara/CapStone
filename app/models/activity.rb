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

  def set_status
     self.update_column(:status, 2) if self.days == 0

     self.update_column(:status, 1) if Date.today >= self.start_date
   end

  after_initialize :set_defaults
  after_update :set_status, :event_days

  def set_defaults
    self.user_id ||= User.last.id
  end

  def event_days
    Integer(self.end_date - closer_to_end_date)
  end

  def closer_to_end_date
    if Date.today >= self.start_date
      Date.today
    elsif self.start_date >= Date.today
      self.start_date
    end
  end

  def event_to_days
    Activity.all.each do |act|
      act.update_attributes(days: act.event_days)
    end
  end

  def self.by_position
    order("position ASC")
  end

  def self.recent
    order("created_at DESC")
  end
end