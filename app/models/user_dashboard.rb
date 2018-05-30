class UserDashboard < ApplicationRecord

  scope :activities_by, ->(user) { where(user_id: user.id) }
  scope :blogs_by, ->(user) { where(user_id: user.id) }

  def self.by_position
    order("position ASC")
  end

end  