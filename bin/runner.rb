require_relative "../config/environment"

DB = SQLite3::Database.new "students.db"
Student.create_table
