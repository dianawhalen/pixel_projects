class PixelProjects::Dribbble
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :profile_url, :web, :dribbbles, :dribbble, :url

  @@all = []

  def initialize(dribbble)
    dribbble.each {|key, value| self.send(("#{key}="), value) }
    @@all << self
  end

  def self.create_from_collection(dribbbles)
    dribbbles.each {|dribbble| PixelProjects::Dribbble.new(dribbble) }
  end

  def self.all
    @@all
  end
end
