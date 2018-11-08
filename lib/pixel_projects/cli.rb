class PixelProjects::CLI
  BASE_PATH = "https://dribbble.com"

  def call
    greeting
    menu
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
    PixelProjects::Dribbble.all.each.with_index(1) do |dribbble, i|
      puts "#{i.to_s.rjust(2, "0")}. ⭑ Dribbble: " + dribbble.title + " by " + dribbble.designer_name
      puts "    ⭑ Shot Url: " + dribbble.shot_url
      puts "    ⭑ Designer Url: " + dribbble.designer_url
      puts "    ⭑ Comment: " + dribbble.comment.gsub("\n","")
      puts "⭑-------------------------------------------------------------⭑"
    end
  end

  def add_attributes_to_designer(the_designer)
    attributes = PixelProjects::Scraper.scrape_designer(the_designer.url)
    the_designer.add_designer_attributes(attributes)
  end

  def list_designer(the_designer)
    puts "⭑-------------------------------------------------------------------------------⭑"
    puts "    ⭑           ⭑           ⭑           ⭑           ⭑           ⭑           ⭑  "
    puts "          ⭑           ⭑           ⭑           ⭑           ⭑           ⭑        "
    puts "    ⭑ Designer: " + the_designer.name
    puts "    ⭑ Location: " + the_designer.location
    puts "    ⭑ Bio: " + the_designer.bio.gsub("\n","")
    puts "    ⭑ Skills: " + the_designer.skills.join(", ")
    puts "    ⭑ Teams: " + the_designer.teams.join(", ")
    puts "    ⭑ Web: " + the_designer.web.join(", ")
    puts "    ⭑ Profile Url: " + the_designer.url
    puts "          ⭑           ⭑           ⭑           ⭑           ⭑           ⭑        "
    puts "    ⭑           ⭑           ⭑           ⭑           ⭑           ⭑           ⭑  "
    puts "⭑-------------------------------------------------------------------------------⭑"
  end

  def menu
    make_dribbbles
    list_dribbbles

    input = nil
    while input != "exit"
      puts "⭆ Enter the number corresponding to the Dribbble you'd like additional information on."
      puts "⭆ To see the most recent Dribbbles again, type 'list', or type 'exit' to quit."

      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= PixelProjects::Dribbble.all.length
        the_designer = PixelProjects::Designer.all[input.to_i-1]
        the_designer.name ? list_designer(the_designer) : add_attributes_to_designer(the_designer) && list_designer(the_designer)
      else input == "list"
        list_dribbbles
      end
    end
  end

  def goodbye
    system "clear"
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
