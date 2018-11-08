class PixelProjects::Designer
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :profile_url, :web, :dribbbles, :dribbble, :url

  @@all = []

  def initialize(url)
    @url = url
    @@all << self
  end

  def self.create_from_collection(dribbbles)
    dribbbles.map {|dribbble| PixelProjects::Designer.new(dribbble.designer_url) }
  end

  def add_designer_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value) }
  end

  def self.all
    @@all
  end
end
