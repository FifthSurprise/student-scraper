# require 'nokogiri'
# require 'open-uri'
# require 'pry'

class StudentScraper
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def scrape
    scrape_students
    create_instance
  end

  def scrape_students
    name = @doc.search("div.big-comment h3 a").text
    excerpt = @doc.search("div.blog-title p.home-blog-post-meta").text
    description = @doc.search("div.excerpt p").text
    htmlpics = @doc.search("div.blog-thumb a img")
    indexPic = htmlpics.collect{|imglink| imglink['src']}
    htmllink = @doc.search("div.blog-thumb a")
    url = htmllink.collect{|profilelink| profilelink['href']}
  end

  def create_instance
    @student = Student.new
    @student.name = @name
    @student.excerpt = @excerpt
    @student.description = @description
    @student.indexPic = @indexPic
    @student.url = @url
    @student.save
    @student
  end
end

# scraper = StudentScraper.new('http://students.flatironschool.com/')
# scraper.scrape_students
