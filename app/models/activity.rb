class Activity < ApplicationRecord
  enum status: { draft: 0, live: 1, ended: 2 }

  validates_presence_of :title, :miles, :days

  def self.draft
    where(status: 'draft')
  end

  def self.live
    where(status: 'live')
  end
end
