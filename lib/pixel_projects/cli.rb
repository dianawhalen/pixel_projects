class PixelProjects::CLI
  BASE_PATH = "https://dribbble.com"

  def call
    greeting
    make_dribbbles
    make_designers
    list_dribbbles
    list_designer
    goodbye
  end

  def greeting
    puts "⭑-------------------------------------------------------------⭑"
    puts "                                                               "
    puts "           ¸,ø¤º°`°º¤ø,¸¸,ø¤º°º¤ø,¸¸,ø¤º°`°º¤ø,¸               "
    puts "      ¸,ø¤º°`°º¤ø,¸¸,ø¤º° WELCOME °º¤ø,¸¸,ø¤º°`°º¤ø,¸          "
    puts "           ¸,ø¤º°`°º¤ø,¸¸,ø¤º°º¤ø,¸¸,ø¤º°`°º¤ø,¸               "
    puts "                                                               "
    puts "      Hold tight for the most recent pixel creations!!         "
    puts "⭑-------------------------------------------------------------⭑"
  end

  def make_dribbbles
    dribbbles = PixelProjects::Scraper.scrape_dribbbles(BASE_PATH + '/#')
    PixelProjects::Dribbble.create_from_collection(dribbbles)
  end

  def list_dribbbles
    @dribbbles = PixelProjects::Dribbble.all
    @dribbbles.each.with_index(1) do |dribbble, i|
      puts "#{i.to_s.rjust(2, "0")}. ⭑ Dribbble: " + dribbble.title + " by " + dribbble.designer_name
      puts "    ⭑ Shot Url: " + BASE_PATH + dribbble.shot_url
      puts "    ⭑ Designer Url: " + BASE_PATH + dribbble.designer_url
      puts "    ⭑ Comment: " + dribbble.comment.gsub("\n","")
      puts "⭑-------------------------------------------------------------⭑"
    end
  end

  def make_designers
    PixelProjects::Dribbble.all.each do |dribbble|
     designers = PixelProjects::Scraper.scrape_designer(BASE_PATH + dribbble.designer_url)
     PixelProjects::Designer.create_from_collection(designers)
   end
  end

  def list_designer
    @designers = PixelProjects::Designer.all
    @designers.each.with_index(1) do |designer, i|
      puts "#{i.to_s.rjust(2, "0")}. ⭑ Designer: " + designer.name
      puts "    ⭑ Location: " + designer.location
      puts "    ⭑ Bio: " + designer.bio
      puts "    ⭑ Skills: " + designer.skills.join(", ")
      puts "    ⭑ Teams: " + designer.teams.join(", ")
      puts "    ⭑ Web: " + designer.web.join(", ")
      puts "    ⭑ Profile Url: " + designer.profile_url
      puts "⭑-------------------------------------------------------------⭑"
    end
  end

  def goodbye
    puts "⭑-------------------------------------------------------------⭑"
    puts "                                                               "
    puts "           ¸,ø¤º°`°º¤ø,¸¸,ø¤º°º¤ø,¸¸,ø¤º°`°º¤ø,¸               "
    puts "      ¸,ø¤º°`°º¤ø,¸¸,ø¤º° GOODBYE °º¤ø,¸¸,ø¤º°`°º¤ø,¸          "
    puts "           ¸,ø¤º°`°º¤ø,¸¸,ø¤º°º¤ø,¸¸,ø¤º°`°º¤ø,¸               "
    puts "                                                               "
    puts "      See you next time for more trending Dribbbles!!          "
    puts "⭑-------------------------------------------------------------⭑"
  end
end
