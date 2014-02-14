class Student
  attr_accessor :name

  def self.create_table
    DB.execute("CREATE TABLE IF NOT EXISTS students (id integer primary key autoincrement, name text")
  end
  def save
    DB.execute("Insert into students (name) values(?) where name=?",name)
  end
end
