class User < ActiveRecord::Base

  # M2b/M4: port de devise (no esta en el Gemfile nuevo).
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

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