class PixelProjects::Dribbble
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :profile_url, :web

  @@all = []

  def initialize(dribbbles)
    dribbbles.each {|key, value| self.send(("#{key}="), value) }
    @@all << self
  end
end
