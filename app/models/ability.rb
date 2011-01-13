class Ability  
  include CanCan::Ability  
  
  def initialize(user)  
    user ||= User.new # Guest user  
    if (user.role?("Admin")) 
      can :manage, :all  
    else  
      can :read, :all  
      can :create, Post  
      can :update, Post do |comment|  
        comment.try(:user) == user  
      end  
    end  
  end 

end