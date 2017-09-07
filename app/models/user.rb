class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible(
    :email,
    :password,
    :password_confirmation,
    :username,
    :role_ids
  )

  has_many :permitions
  has_many :roles ,:through => :permitions

  def role
    roles.map(&:name)
  end

  def role?(rol)
    role.include?(rol)
  end

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
