class UserPolicy < ApplicationPolicy
  def index_projects?
    user.present? && user.id == record.id
  end
end
