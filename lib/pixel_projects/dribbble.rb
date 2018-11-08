class PixelProjects::Dribbble
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :web, :url, :designer

  @@all = []

  def initialize(dribbble, designer = nil)
    dribbble.each {|key, value| self.send(("#{key}="), value) }
    @designer = PixelProjects::Designer.new(dribbble[:designer_url])
    @@all << self
  end

  def self.create_from_collection(dribbbles)
    dribbbles.each {|dribbble| PixelProjects::Dribbble.new(dribbble) }
  end

  def self.all
    @@all
  end
end
