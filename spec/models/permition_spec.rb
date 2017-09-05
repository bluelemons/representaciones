require 'rails_helper'

describe Permition do
  it { belong_to :role }
  it { belong_to :user }
end
