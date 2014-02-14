class StudentScraper
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def scrape
    scrape_name
    create_instance
  end

  def scrape_student
    @name = @doc.search("div.big-comment h3 a").text
    @quotes = @doc.search("div.blog-title p.home-blog-post-meta").text
    @description = @doc.search("div.excerpt p").text
    @htmlpics = @doc.search("div.blog-thumb a img")
    @indexpics = @htmlpics.collect{|imglink| imglink['src']}
    @htmllink = @doc.search("div.blog-thumb a")
    @url = @htmllink.collect{|profilelink| profilelink['href']}
  end

  def create_instance
    @student = Student.new
    @student.name = @name
    @student.quotes = @quotes
    @student.description = @description
    @student.indexpics = @indexpics
    @student.url = @url
    @student.save
    @student
  end
end