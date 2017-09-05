require 'rails_helper'

describe Provincia do
  it { have_many :departamentos }
end
