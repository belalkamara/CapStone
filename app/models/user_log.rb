class UserLog < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :miles, :day

  scope :user_log_by, ->(user) { where(user_id: user.id) }
end
