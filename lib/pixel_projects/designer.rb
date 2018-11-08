class PixelProjects::Designer
  attr_accessor :title, :comment, :shot_url, :designer_url, :designer_name, :name, :location, :bio, :skills, :teams, :web, :url

  @@all = []

  def initialize(url)
    @url = url
    @@all << self
  end

  def add_designer_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value) }
  end

  def self.all
    @@all
  end
end
