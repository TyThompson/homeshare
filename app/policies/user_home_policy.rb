class UserHomePolicy < ApplicationPolicy
  def update?
    is_admin? || is_owner?
  end

  def leave?
     is_admin? || is_owner?
  end

end
