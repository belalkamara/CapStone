class BlogPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || user.role == :site_admin
  end
end