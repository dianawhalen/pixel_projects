class PixelProjects::CLI
  BASE_PATH = "https://dribbble.com"

  def call
    greeting
    make_dribbbles
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
