class UserDashboard < ApplicationRecord

  scope :activities_by, ->(user) { where(user_id: user.id) }
  scope :blogs_by, ->(user) { where(user_id: user.id) }
  scope :user_log_by, ->(user) { where(user_id: user.id) }
  
  def self.by_position
    order("position ASC")
  end

  def self.recent
    order("created_at DESC")
  end

end  