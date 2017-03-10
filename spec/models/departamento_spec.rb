require 'rails_helper'

describe Departamento, type: :model do
  subject { FactoryGirl.build :departamento }

  let(:provincia) { subject.provincia }

  it { should have_many :localidads }
  it { should belong_to :provincia }

  it 'delegate provincia name to pname' do
    expect(subject.pname).to eq provincia.name
  end
end
