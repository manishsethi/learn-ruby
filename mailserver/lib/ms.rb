require 'rubygems'
require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'gmail.com',
            :user_name            => 'canimakeit9211@gmail.com',
            :password             => 'mahipal123',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
 Mail.defaults do
  delivery_method :smtp, options
end

 mail = Mail.new do
      from 'canimakeit@gmail.com'
        to 'manishsethi2009@gmail.com'
   subject 'This is a test email'
      body File.read('body.txt')
 end

puts mail.to_s
