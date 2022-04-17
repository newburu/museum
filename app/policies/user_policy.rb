class UserPolicy < ApplicationPolicy
  
  def new?
    user.present?
  end

  def create?
    new?
  end

  def show?
    true
  end

  def edit?
    record == user
  end

  def update?
    edit?
  end

  def destroy?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
