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

#   projects = {}
# kickstarter.css("li.project.grid_4").each do |project|
#   title = project.css("h2.bbcard_name strong a").text.to_sym
#   projects[title] = {
#     :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
#     :description => project.css("p.bbcard_blurb").text,
#     :location => project.css("ul.project-meta span.location-name").text,
#     :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
#   }

  def scrape_students

    @students = [] 

    profile_html = @doc.search("li.home-blog-post")  
    profile_html.each do |profile|
      puts profile.css ("div.big-comment h3 a")
      # student = {}
      # student[:name] = profile.css("div.big-comment h3 a").text
# puts student

    end



    # name = @doc.search("div.big-comment h3 a").text
    # excerpt = @doc.search("div.blog-title p.home-blog-post-meta").text
    # description = @doc.search("div.excerpt p").text
    # htmlpics = @doc.search("div.blog-thumb a img")
    # indexPic = htmlpics.collect{|imglink| imglink['src']}
    # htmllink = @doc.search("div.blog-thumb a")
    # url = htmllink.collect{|profilelink| profilelink['href']}
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

scraper = StudentScraper.new('http://students.flatironschool.com/')
puts scraper.scrape_students
