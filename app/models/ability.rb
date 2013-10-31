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
            #can :flag, Comment

        elsif user.role? :listener
            #can :read, :all
            #can :create, Comment
            #can :update, Comment do |comment|
                #comment.user == user
            #end
        end
    end
end
