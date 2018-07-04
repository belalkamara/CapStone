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


  # after_save :event_to_days
  # after_save :set_status

  # def set_status
  #    self.update_column(:status, 2) if self.days == 0

  #    self.update_column(:status, 1) if Date.today >= self.start_date
  # end

  # def event_days
  #   Integer(self.end_date - closer_to_end_date)
  # end

  # def closer_to_end_date
  #   Activity.all.each do |act|
  #     if Date.today >= act.start_date
  #       Date.today
  #     elsif act.start_date > Date.today
  #       act.start_date
  #     end
  #   end
  # end

  # def event_to_days
  #   Activity.all.each do |act|
  #     act.update_attributes(days: act.event_days)
  #   end
  # end

end