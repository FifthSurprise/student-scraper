require_relative 'spec_helper'
require_relative '../config/environment.rb'

describe "Student" do
  before(:each) do
  end

  after(:each)do
  end

  it 'has a name' do
    s = Student.new
    s.name = "Joe Smith"
    expect(s.name).to eq("Joe Smith")
  end


end
