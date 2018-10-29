class PixelProjects::CLI
  BASE_PATH = "https://dribbble.com"

  def call
    greeting
    make_dribbbles
    make_designers
    list_dribbbles
    list_designer
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
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "⭆ Enter the number corresponding to the Dribbble you'd like additional information on."
      puts "⭆ To see the most recent Dribbbles again, type 'list', or type 'exit' to quit."

      input = gets.strip.downcase

      if input.to_i > 0
        the_designer = @designers[input.to_i-1]
          puts "⭑-----------------------------------------------------------------------------⭑"
          puts "    ⭑ Designer: " + the_designer.name
          puts "    ⭑ Location: " + the_designer.location
          puts "    ⭑ Bio: " + the_designer.bio
          puts "    ⭑ Skills: " + the_designer.skills.join(", ")
          puts "    ⭑ Teams: " + the_designer.teams.join(", ")
          puts "    ⭑ Web: " + the_designer.web.join(", ")
          puts "    ⭑ Profile Url: " + the_designer.profile_url
          puts "    ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑     ⭑"
          puts "    To see the most recent Dribbbles again, type 'list', or type 'exit' to quit."
          puts "⭑-----------------------------------------------------------------------------⭑"
      else input == "list"
        list_dribbbles
      end
    end
  end

  def goodbye
    puts "                                                               "
    puts "           ¸,ø¤º°`°º¤ø,¸¸,ø¤º°º¤ø,¸¸,ø¤º°`°º¤ø,¸               "
    puts "      ¸,ø¤º°`°º¤ø,¸¸,ø¤º° GOODBYE °º¤ø,¸¸,ø¤º°`°º¤ø,¸          "
    puts "           ¸,ø¤º°`°º¤ø,¸¸,ø¤º°º¤ø,¸¸,ø¤º°`°º¤ø,¸               "
    puts "                                                               "
    puts "      See you next time for more trending Dribbbles!!          "
    puts "⭑-------------------------------------------------------------⭑"
  end
end
