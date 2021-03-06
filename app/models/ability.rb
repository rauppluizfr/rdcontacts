class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.is_admin?
        can :manage, :all
      else
        can :manage, User do |user|
            user.id == user.id
        end
        can :manage, Client do |client|
            user.id == client.id
        end
        can :new, CustomFormField
        can :manage, CustomFormField do |field|
            user.id == field.user_id
        end
        can :new, Contact
        can :manage, Contact do |c|
            user.id == c.user_id
        end
      end
  end
end
