class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Bus

    if user.present?
      case user.role
      when 'driver'
        can [:read, :create], Issue
      when 'mechanic'
        can :read, :all
        can :manage, Issue
      when 'passenger'
      when 'admin'
        can :manage, :all
      end
    end
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

