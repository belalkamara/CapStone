class UserDashboard < ApplicationRecord

  scope :activities_by, ->(user) { where(user_id: user.id) }
  scope :blogs_by, ->(user) { where(user_id: user.id) }

  def daily_miles
    
  end

end  