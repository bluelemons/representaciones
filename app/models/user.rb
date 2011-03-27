class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:username
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:role_ids,:username
  has_many :permitions
  has_many :roles ,:through => :permitions

  def role #array con los roles del usuario
    roles.map do |role|
      role.name
    end
  end

  def role?(rol) #true si el usuario tiene el rol
    role.include?(rol)
  end

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

end

