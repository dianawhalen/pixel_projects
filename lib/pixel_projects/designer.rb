class PixelProjects::Designer
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :profile_url, :web

  @@all = []

  def initialize(designers)
    designers.each {|key, value| self.send(("#{key}="), value) }
    @@all << self
  end

  def self.create_from_collection(designers)
    designers.each {|designer| PixelProjects::Designer.new(designer) }
  end

  def self.all
    @@all
  end
end
