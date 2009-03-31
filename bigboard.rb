require 'rubygems'
require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

source = "http://builder.integrumdemo.com/projects.rss"
content = "" # raw content of rss feed will be loaded here
open(source) do |s| content = s.read end
rss = RSS::Parser.parse(content, false)

failed = rss.channel.items.select {|item| (item.title =~ /failed/) != nil }

File.open("index.html", "w") do |file| 

file.write "<html>\n"
file.write "<head>\n"
file.write "<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" media=\"all\">\n"
file.write "</head>\n"
file.write "<body>\n"


  if failed.length == 0
    file.write("<div id=\"good\">All is well!</div>\n")
  else
    file.write "<ul id=\"fail\">\n"
    failed.each do |item|
      file.write "<li>#{item.title}</li>\n"
    end
    file.write "</ul>"
  end

file.write "</body>\n"  
file.write "</html>\n"  
end
