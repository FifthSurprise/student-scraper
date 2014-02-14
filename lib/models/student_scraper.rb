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
  end

end

scrape = StudentScraper.new("http://students.flatironschool.com/")
puts scrape.scrape_student