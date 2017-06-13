class ProjectPolicy < ApplicationPolicy
  def show?
    user.present? && owner?
  end

  def new_floorplan?
    user.present? && owner?
  end

  private

  def project
    record
  end

  def owner?
    project.user_id == user.id
  end
end
