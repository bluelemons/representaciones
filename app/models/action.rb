class Action < ActiveRecord::Base
  has_many :depositos, dependent: :destroy
end
