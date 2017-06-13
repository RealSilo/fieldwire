class ProjectPolicy < ApplicationPolicy

  def show?
    user.present? && project.user_id == user.id
  end

  private

    def project
      record
    end
end