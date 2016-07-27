class ListPolicy < ApplicationPolicy
  def update?
    is_admin? || is_owner?
  end

  def destroy?
     is_admin? || is_owner?
  end

end
