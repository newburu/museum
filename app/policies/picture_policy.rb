class PicturePolicy < ApplicationPolicy
  
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
    record.try(:museum).try(:user) == user
  end

  def update?
    edit?
  end

  def destroy?
    record.try(:museum).try(:user) == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
