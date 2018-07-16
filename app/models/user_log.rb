class UserLog < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :miles, :day

  scope :user_log_by, ->(user) { where(user_id: user.id) }

  def self.recent_day
    order("miles DESC")
  end

  def self.recent_day
    order("day DESC")
  end
end
