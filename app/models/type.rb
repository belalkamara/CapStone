class Type < ApplicationRecord
  validates_presence_of :title

  has_many :activities

  def self.with_activities
    includes(:activities).where.not(activities: { id: nil })
  end
end
