#!/usr/bin/env ruby

require 'gmail'
gmail = Gmail.new(ENV['username'],ENV['password'])


puts "Count: #{gmail.inbox.count}"
puts "=========== Sending Email =============================="
gmail.deliver do 
	to "admin@gmail.com"
	subject "Hi from HPCloud"
	text_part do 
		body "New instance created"
	end

end
puts "Sent"
gmail.logout
