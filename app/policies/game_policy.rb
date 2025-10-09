class GamePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all  # Admins see everything
      else
        scope.where(user_id: user.id)  # Users see only their own
      end
    end
  end

  # Action methods control WHAT ACTIONS users can perform
  def show?
    record.user_id == user.id || user.admin?
  end

  def create?
    user.present?  # Any logged-in user can create
  end

  def update?
    user.admin? || record.user_id == user.id
  end

  def destroy?
    user.admin? || record.user_id == user.id
  end
end
