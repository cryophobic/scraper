require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

pages = []

1.upto(10) do |page_number|
	pages << Nokogiri::HTML(open("http://www.last.fm/music/+tag/electronic?page=#{page_number}"))
	print '[*]'
end

artists = []

pages.each do |page|
		page.css('.artistList > li').each do |dom_element|
		artist = {}
		artist[:name] = dom_element.at_css('a.name').text
		artist[:img_src] = dom_element.at_css('span.image > img').attr('src')
		artist[:play_count] = dom_element.at_css('p.stats').text #.text.to_i
		artists << artist
	end
 
end
# puts
# artists.each {|z| puts z[:name]} #this prints all artists



File.open('electronic.html', 'w') do |f|
	f.puts("<html>")
	f.puts("<head>")
	f.puts("<LINK href=\"css/test.css\" rel=\"stylesheet\" type=\"text/css\">")
	f.puts("<meta charset=\"UTF-8\">")
	# f.puts("<LINK href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\">")
	f.puts("")
	f.puts("")
	f.puts("")
	f.puts("")
	f.puts("")
	f.puts("<title>Electronic Music Trending Today</title>")
	f.puts("</head>")
	f.puts("<body>")
	f.puts("<div class=\"body\">)
	f.puts("<h1>Electronic Music Trending Today</h1>")
	f.puts("<div class=\"wrapper\">")
	f.puts("<ul>")

	artists.each do |artist|
		f.puts("<div class=\"cover\"><img src=#{artist[:img_src]}></img></div>")
		f.puts("<li>#{artist[:name]}</li>")
		f.puts("<li>#{artist[:play_count]}</li>")
	end
	# f.puts("<li>" + artists[0][:name] + "</li>")

	f.puts("</ul>")
	f.puts("</div>")
	f.puts("</div>")
	f.puts("</body>\n")
	f.puts("</html>\n")
end