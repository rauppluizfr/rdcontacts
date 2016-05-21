class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.is_admin?
        can :manage, :all
      else
        can :manage, Client do |client|
            user.id == client.id
        end

        can :manage, CustomFormField do |field|
            user.id == field.user_id
        end
      end
  end
end
