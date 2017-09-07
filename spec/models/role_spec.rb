require 'rails_helper'

describe Role do
  it { have_many :permitions }
  it { have_many :users }
end
