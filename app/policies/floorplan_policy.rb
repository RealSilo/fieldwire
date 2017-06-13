class FloorplanPolicy < ApplicationPolicy
  def show?
    user.present? &&  project_user?
  end

  def edit?
    user.present? &&  project_user?
  end

  def update?
    user.present? &&  project_user?
  end

  private

  def floorplan
    record
  end

  def project_user?
    floorplan.project.user_id == user.id
  end
end
