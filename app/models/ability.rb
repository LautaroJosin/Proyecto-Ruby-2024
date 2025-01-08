# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil? # user is a guest
      cannot :read, User
      can :read, Product

    else

      if user.is_admin?
        can :manage, :all

      elsif user.is_manager?
        can :manage, Product
        can :manage, User
        cannot :update, User, { role_int: "admin" }
        cannot :create, User, { role_int: "admin" }

      elsif user.is_employee?
        can :manage, Product
        cannot :manage, User
      end
    end
  end
end
