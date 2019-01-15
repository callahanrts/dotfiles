#!/bin/ruby

app = %x( ls /Applications | grep bersicht ).gsub(/.app/, '').gsub(/\n/, '')
puts "osascript -e 'tell application \"#{app}\" to refresh'"
%x( echo "osascript -e 'tell application \"#{app}\"' to refresh'" > uberrefresh )
%x( osascript -e 'tell application "#{app}" to refresh' )
%x( echo 'test' >> chunk.log )
