require 'rubygems'
require 'nokogiri'
require 'open-uri'

pages = []
artist_name = []
play_data = []
img_src = []

1.upto(10) do |x|
	pages << Nokogiri::HTML(open("http://www.last.fm/music/+geo/canada/electronic?page=#{x}"))
end

pages.each do |page|
	artist_name << page.css('a.name')
	img_src << page.css('.image > img')
	play_data << page.css('p.stats')
end

[{
	:name => "Nas",
	:play_count => 2000000,
	:img_url => "nas.jpg"
	},
	{

	}
]

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
	f.puts("<title>Our test page</title>")
	f.puts("</head>")
	f.puts("<body>")
	f.puts("<h1>Electronic Music Trending Today</h1>")
	f.puts("<ul>")

	artist_name.each do |artist_name|
		f.puts("<li>" + artist_name.text + "</li>")
	end
	
	play_data.each do |play_data|
		f.puts("<li>" + play_data.text + "</li>")
	end

	img_src.each do |img_src|
		f.puts("<li>" + img_src.to_html + "</li>")
	end


	f.puts("</ul>")
	f.puts("</body>\n")
	f.puts("</html>\n")
end