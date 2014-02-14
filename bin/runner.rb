require_relative "../config/environment"

#created the database & table
DB = SQLite3::Database.new "students.db"
Student.create_table

#scrape all of the students off the page into an array
scraper = StudentScraper.new('http://students.flatironschool.com')
scrapedStudentsArray = scraper.scrape

#create an array for Student objects
studentObjectList = []

#create students from the array of students
scrapedStudentsArray.each do |studentHash|
  studentObjectList.push(Student.new(studentHash))
end
