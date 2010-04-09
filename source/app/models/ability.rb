class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if  user.new_record?
      can :create, UserSession
      can :create, User
    else
      can :destroy, UserSession
      can [:read, :edit], User do |u|
        u && u == user
      end
      
      if user.has_role? :admin
        can :manage, :all
      end
    end
  end
end
