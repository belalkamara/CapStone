require 'date'

class Activity < ApplicationRecord
  has_many :types
  accepts_nested_attributes_for :types, 
                                reject_if: lambda { |attr| attr['name'].blank? }

  include ImagePlaceholder
  enum status: { draft: 0, live: 1, ended: 2 }

  validates_presence_of :title, :miles, :image, :status, :description, :start_date, :end_date

  def self.draft
    where(status: 'draft')
  end

  def self.live
    where(status: 'live')
  end

  after_initialize :set_defaults
  after_update :set_status

  def set_defaults
    self.image ||= ImagePlaceholder.image_generator(height:'300', width:'200')
  end

  def event_days
    Integer(Date.new(self.end_date) - (closer_to_end_date))
  end

  def closer_to_end_date
    if Date.today >= Date.new(self.start_date)
      Date.today
    elsif Date.new(self.start_date) >= Date.today
      Date.new(self.start_date)
    end
  end
end