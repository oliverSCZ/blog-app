# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    can :read, Post
    
    return unless user.present?

    # can :read, [Post, Comment], author_id: user.id
    # can :update, [Post, Comment], author_id: user.id
    # can :destroy, [Post, Comment], author_id: user.id
    # can :create, [Post, Comment], author_id: user.id
    # return unless user.admin? 

    # can :create, [Post, Comment]
    # can :destroy, [Post, Comment]

   def initialize( user )
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

   
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
