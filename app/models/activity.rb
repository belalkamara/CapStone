class Activity < ApplicationRecord
  enum status: { draft: 0, live: 1, ended: 2 }

  validates_presence_of :title, :miles, :days, :image, :status

  def self.draft
    where(status: 'draft')
  end

  def self.live
    where(status: 'live')
  end

  after_initialize :set_defaults, :set_status

  def set_defaults
    self.image ||= "http://via.placeholder.com/300x200"
  end

  def set_status
    if self.days.nil? || self.days == 0
      self.ended!
    end
  end
end
