require_relative 'spec_helper'
require_relative '../config/environment.rb'

describe "Student" do
  before(:each) do
    DB.execute("CREATE TABLE IF NOT EXISTS students (id integer primary key autoincrement,
      name text, excerpt text, description text, indexPic text, url text)")
  end

  after(:each)do
    DB.execute("DROP TABLE students")
  end

  it 'has a name' do
    s = Student.new
    s.name = "Joe Smith"
    expect(s.name).to eq("Joe Smith")
  end

  it 'has a description' do
    s = Student.new
    s.description = "I am Joe Smith"
    expect(s.description).to eq("I am Joe Smith")
  end
  it 'has a excerpt' do
    s = Student.new
    s.excerpt = "test excerpt"
    expect(s.excerpt).to eq("test excerpt")
  end
  it 'has a indexPic' do
    s = Student.new
    s.indexPic = "joesmith.jpeg"
    expect(s.indexPic).to eq("joesmith.jpeg")
  end
  it 'has a url' do
    s = Student.new
    s.url = "student.com/joesmith.html"
    expect(s.url).to eq("student.com/joesmith.html")
  end

  it 'can save into database' do
    s = Student.new
    s.name = "Joe Smith"
    s.description = "I am Joe Smith"
    s.excerpt = "test excerpt"
    s.indexPic = "joesmith.jpeg"
    s.url = "student.com/joesmith.html"
    s.save

    results = DB.execute ("select name from students where name = 'Joe Smith'")
    expect(results[0][0]).to eq("Joe Smith")
  end


end
