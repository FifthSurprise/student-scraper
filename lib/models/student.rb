class Student
  attr_accessor :name, :excerpt, :description, :indexPic, :url

  def initialize (studentHash)
    @name = studentHash[:name]
    @excerpt = studentHash[:excerpt]
<<<<<<< HEAD
    @description = studentHash[:description].reverse.chomp.reverse.chomp
=======
    @description = studentHash[:description].chomp
>>>>>>> bd534192bb92f3c0a02176ddf3f6d2c3f86c16d3
    @indexPic = studentHash[:indexPic]
    @url = studentHash[:url]

    save
  end

  def self.create_table
    DB.execute("CREATE TABLE IF NOT EXISTS students (id integer primary key autoincrement,
      name text, excerpt text, description text, indexPic text, url text)")
  end

  def save
    DB.execute("INSERT INTO students (name,excerpt,description,indexpic,url) values(?,?,?,?,?)",
               @name,@excerpt,@description,@indexPic,@url)
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
end
