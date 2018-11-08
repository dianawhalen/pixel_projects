class PixelProjects::Scraper
  BASE_PATH = "https://dribbble.com"

  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :web, :url

  def self.scrape_dribbbles(dribbbles_url)
    doc = Nokogiri::HTML(open(BASE_PATH + '/#'))

    dribbbles = []

    doc.css('.main-full ol.dribbbles li.group').each do |dribbble|
      if dribbble.at("a.hoverable.url").attributes.keys.include?("href")
        title = dribbble.css("a.dribbble-over").search('strong').text
        comment = dribbble.css("a.dribbble-over").search("span.comment").text
        shot_url = dribbble.at("a.dribbble-over").attr('href').prepend(BASE_PATH)
        designer_url = dribbble.at("a.hoverable.url").attr('href').prepend(BASE_PATH)
        designer_name = dribbble.at("a.hoverable.url").text.strip

        dribbbles << {title: title, comment: comment, shot_url: shot_url, designer_url: designer_url, designer_name: designer_name}
      end
    end
    dribbbles
  end

  def self.scrape_designer(designer_url)
    doc = Nokogiri::HTML(open(designer_url))

    designer_hash = {}

    page = doc.css('.main-full.floating-sidebar-container.group')

    designer_hash[:name] = page.at("a.url").text.strip
    designer_hash[:location] = page.css("h2.vcard").search("span.locality").text
    designer_hash[:bio] = page.css(".bio").text
    designer_hash[:skills] = page.css("ul.skills-list").search("a").map(&:text)
      teams = page.css("ul.profile-details.on-teams").search("a").map(&:text).map(&:strip)
      links = page.css("ul.profile-details").search("a").map(&:text).map(&:strip)
      web = links - teams
    designer_hash[:teams] = teams
    designer_hash[:web] = web

    designer_hash
  end
end
