# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(customer)
    if customer
      if customer.admin?
        admin_abilities
      else
        authenticated_abilities
      end
    else
      guest_abilities
    end
  end

  private

  def admin_abilities
    can :manage, :all
  end

  def authenticated_abilities
    can :create, Book
  end

  def guest_abilities
    can :read, :sign_up
  end
end
