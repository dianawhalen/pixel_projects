BASE_PATH = "https://dribbble.com/"

DRIBBBLES PAGE
Nokogiri::HTML(open("https://dribbble.com"))
	⁃	Dribbbles
  	⁃	Title
  	⁃	Comment
  	⁃	Shot Url
  	⁃	Designer Url
  	⁃	Designer Name

DESIGNER PAGE
Nokogiri::HTML(open(designer_url))
	⁃	Designers
  	⁃	Profile Url
  	⁃	Name
  	⁃	Location
		⁃	Bio
  	⁃	Skills
  	⁃	Teams
  	⁃	Web
