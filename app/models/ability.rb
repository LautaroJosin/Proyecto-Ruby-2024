# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    p user

    if user.nil?

      p "User no esta logueado"
      cannot :read, User
      can :read, Product

    else

      if user.is_admin?
        # p "User es admin"
        can :manage, :all

      elsif user.is_manager?
        # p "User es manager"
        can :manage, Product
        can :read, User
        can :update, User, { role_int: "employee" }

      elsif user.is_employee?
        p "User es employee"
      end
    end
  end
end
