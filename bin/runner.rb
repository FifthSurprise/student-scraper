require_relative "../config/environment"

DB = SQLite3::Database.new "students.db"
Students.create_table
