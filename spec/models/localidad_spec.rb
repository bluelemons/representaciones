require 'rails_helper'

describe Localidad do
  subject { FactoryGirl.build :localidad }

  it { belong_to :departamento }

  it 'returns provincia name' do
    expect(subject.pname).to eq subject.departamento.provincia.name
  end

  it 'returns provincia' do
    expect(subject.p).to eq subject.departamento.provincia
  end

  it 'returns departamento' do
    expect(subject.d).to eq subject.departamento
  end

  it 'returns departamento name' do
    expect(subject.dname).to eq subject.departamento.name
  end

  it 'returns localidad name' do
    expect(subject.lname).to eq subject.name
  end
end
