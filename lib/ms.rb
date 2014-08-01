require 'rubygems'
require 'net/smtp'
require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 465,
            :domain               => 'gmail.com',
            :user_name            => 'canimakeit9211@gmail.com',
            :password             => 'mahipal123',
            :authentication       => 'plain',
            :enable_starttls_auto => true,
	    :ssl                  => true,
    	    :openssl_verify_mode  => 'none' }   
 Mail.defaults do
  delivery_method :smtp, options
end

 mail = Mail.new do
     from 'canimakeit@gmail.com'
        to 'manishsethi2009@gmail.com'
   subject 'This is a test email'
      body 'Hello '
 end

puts mail.to_s
