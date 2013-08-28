require 'rubygems'
require 'nokogiri'
require 'open-uri'

pages = []
electronics = []

1.upto(10) do |x|
	# x.to_s.gsub!(/"num"/, "x")
	pages << Nokogiri::HTML(open("http://www.last.fm/music/+geo/canada/electronic?page=#{x}"))
end

pages.each do |page|
	electronics << page.css('a.name')
end

File.open('electronic.html', 'w') do |f|
	f.puts("<html>")
	f.puts("<head>")
	f.puts("<LINK href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\">")
	f.puts("<LINK href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\">")
	f.puts("")
	f.puts("")
	f.puts("")
	f.puts("")
	f.puts("")
	f.puts("<title>Our test page</title>")
	f.puts("</head>")
	f.puts("<body>")
	f.puts("<h1>Electronic Music Trending Today</h1>")
	f.puts("<ul>")

	electronics.each do |electronic|
		f.puts("<li>" + electronic.text + "</li>")
	end

	f.puts("</ul>")
	f.puts("</body>\n")
	f.puts("</html>\n")
end