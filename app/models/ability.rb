class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Article
    can :read, Company
    can :subscription_page, Company
    if user.candidate?
      can :manage, :all
    else
      can :manage, User, id: user.id
    end
  end
end
