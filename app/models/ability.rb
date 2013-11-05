class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        if user.role? :admin
            can :manage, :all

        elsif user.role? :artist
            can :read, :all
            can :create, Track
            can :update, Track do |track|
                track.user == user
            end
            can :destroy, Track do |track|
                track.user == user
            end
            can :update, User do |user|
                user == current_user
            end
            can :destroy, User do |user|
                user == current_user
            end
            can :flag, Comment

        elsif user.role? :listener
            can :read, :all
            can :create, Comment
            can :destroy, Comment do |comment|
                comment.user == user
            end
            can :flag, Comment
        end
    end
end

# manage = all actions available
# read = ONLY index and show actions available to that user
