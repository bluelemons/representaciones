class Role < ActiveRecord::Base
  has_many :permitions
  has_many :users, through: :permitions
end
