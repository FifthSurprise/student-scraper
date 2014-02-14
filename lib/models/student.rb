class Student
  attr_accessor :name, :excerpt, :description, :indexPic, :url

  def self.create_table
    DB.execute("CREATE TABLE IF NOT EXISTS students (id integer primary key autoincrement,
      name text, excerpt text, description text, indexPic text, url text)")
  end
  def save
    #DB.execute("Insert into students (name) values(?) where name=?",name,excerpt,description,indexpic,url)
    DB.execute("INSERT INTO student (name,excerpt,description,indexpic,url) values (:name, :excerpt, :description, :indexpic, :url)", to_h)

  end
  def to_h
    {
      :name =>name,
      :excerpt =>excerpt,
      :description =>description,
      :indexPic => indexPic,
      :url => url,
    }
  end
  # Name
  # Excerpt
  # Description
  # IndexPic
  # ProfileLink
end
