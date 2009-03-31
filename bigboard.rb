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
file.write "<LINK REL=StyleSheet HREF=\"style.css\" TYPE=\"text/css\" MEDIA=all>\n"
file.write "</head>\n"
file.write "<body>\n"


  failed.each do |item|
    puts item.title
    # item['description'][0] =~ /evision (\d+) committed by (\w+)/
    # revision = $1
    # committer = $2
    # puts "#{revision} - #{committer}"
    file.write "<ul>" + item.title + "</ul>\n" 
  end

file.write "</body>\n"  
file.write "</html>\n"  
end
