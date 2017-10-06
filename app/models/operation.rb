class Operation < ActiveRecord::Base
  has_many :depositos, dependent: :destroy
end
