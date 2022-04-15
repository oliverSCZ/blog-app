class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.role == 'admin'
      can :manage, Post
      can :manage, Comment
    else
      can :read, Post
      can :create, Post
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, author_id: user.id
    end
  end
end
