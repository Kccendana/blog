class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Post, author_id: user.id
      can :manage, Comment, user_id: user.id
      can :read, :all
    end
  end
end
