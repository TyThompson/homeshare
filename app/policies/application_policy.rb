class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    false || is_admin?
  end

  def edit?
    update?
  end

  def destroy?
    false || is_admin?
  end

  def is_admin?
    user.admin?
  end

  def is_owner?
    user == record.user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
