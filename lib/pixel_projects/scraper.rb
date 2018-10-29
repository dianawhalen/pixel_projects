class PixelProjects::Scraper
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name

  def self.scrape_dribbbles(dribbbles_url)
    doc = Nokogiri::HTML(open("https://dribbble.com/#"))

    dribbbles = []

    doc.css('.main-full ol.dribbbles li.group').each do |dribbble|
      title = dribbble.css("a.dribbble-over").search('strong').text
      comment = dribbble.css("a.dribbble-over").search("span.comment").text
      shot_url = dribbble.at("a.dribbble-over").attr('href')
      designer_url = dribbble.at("a.hoverable.url").attr('href')
      designer_name = dribbble.at("a.hoverable.url").text.strip

      dribbbles << {title: title, comment: comment, shot_url: shot_url, designer_url: designer_url, designer_name: designer_name}
    end
    dribbbles
  end

end
