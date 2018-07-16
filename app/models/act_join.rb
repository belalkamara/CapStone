class ActJoin < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :user_id, presence: true
  validates :activity_id, presence: true

  scope :act_by, ->(user) { where(user_id: user.id) }

  # after_create_commit { ActJoinBroadcastJob.perform_later(self) }
end