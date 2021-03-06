class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :index, Post do |post|
        post.user == user
      end

      can :show, Post do |post|
        post.user == user
      end

      can :update, Post do |post|
        post.user == user
      end

      can :destroy, Post do |post|
        post.user == user
      end

      can :destroy, Keep do |keep|
        keep.user == user
      end

      can :destroy, Comment do |comment|
        comment.user == user
      end

      can :index, Keep do |keep|
        keep.user == user
      end

      can :update, Event do |event|
        event.user == user
      end

      can :destroy, Event do |event|
        event.user == user
      end

      can :create, Event do |event|
        event.user == user
      end

      can :new, Event do |event|
        event.user == user
      end



      can :read, Event
      can :create, Post
      can :create, Keep
    end







  end
end
