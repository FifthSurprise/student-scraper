require 'nokogiri'
require 'open-uri'


class StudentScraper
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def scrape
    scrape_students
    create_instance
  end

  def scrape_students
    htmllink = @doc.search("div.blog-thumb a")
    url = htmllink.collect{|profilelink| profilelink['href']}
    @students = []

    url.each do |profile|
      profile_doc = Nokogiri::HTML(open("http://students.flatironschool.com/#{profile}"))
       name = profile_doc.search("h4.ib_main_header").text
       excerpt = profile_doc.search("div.textwidget h3").text
       description = profile_doc.search("div.services p")[0].text
       github = profile_doc.search("div.coder-cred a")[0]['href']

       @students << {:name => name, :excerpt => excerpt, :description => description}
    
    end
    puts @students
    

  end



  # name = @doc.search("div.big-comment h3 a").text
  # excerpt = @doc.search("div.blog-title p.home-blog-post-meta").text
  # description = @doc.search("div.excerpt p").text
  # htmlpics = @doc.search("div.blog-thumb a img")
  # indexPic = htmlpics.collect{|imglink| imglink['src']}


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

scraper = StudentScraper.new('http://students.flatironschool.com/')
scraper.scrape_students
