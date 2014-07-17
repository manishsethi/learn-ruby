require 'rubygems'
require 'fog'

conn = Fog::Compute.new(
       :provider => "HP",
       :version => :v2,
       :hp_access_key => "HP_ACCESS_KEY", 
       :hp_secret_key => "HP_SECRET_KEY",
       #:hp_auth_uri => "",
       :hp_tenant_id => "HP_TENANT_ID",
       :hp_avl_zone => "region-b.geo-1",
        )

#puts "connection: #{conn.inspect}"
response = conn.list_servers
puts "########"
response = conn.list_images_detail
puts "#{response.body['images']}"                     # returns an array of image hashes
puts "#{response.body['images'][0]['name']}" 
