#!/usr/bin/env ruby

require 'gmail'

gmail = Gmail.new(ENV['username'],ENV[' password'])


puts "Count: #{gmail.inbox.count}"
puts "=========== Sending Email =============================="
gmail.deliver do 
	to "somebody@gmail.com"
	subject "Hi from someone "
	text_part do 
		body "Text message"
	end

end
puts "Sent"
gmail.logout
