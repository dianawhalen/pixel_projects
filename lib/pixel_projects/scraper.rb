class PixelProjects::Scraper
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :profile_url, :web

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

  def self.scrape_designer(designer_url)
    doc = Nokogiri::HTML(open(designer_url))

    designers = []

    doc.css('.main-full.floating-sidebar-container.group').each do |designer|
      profile_url = designer.at("h2.vcard a.url").attr('href').prepend("https://dribbble.com")
      name = designer.at("a.url").text.strip
      location = designer.css("h2.vcard").search("span.locality").text
      bio = designer.css(".bio").text
      skills = designer.css("ul.skills-list").search("a").map(&:text)
      teams = designer.css("ul.profile-details.on-teams").search("a").map(&:text).map(&:strip)
      links = designer.css("ul.profile-details").search("a").map(&:text).map(&:strip)
      web = links - teams

      designers << {profile_url: profile_url, name: name, location: location, bio: bio, skills: skills, teams: teams, web: web}
    end
    designers
  end
end
