require 'rubygems'
require 'fog'

conn = Fog::Compute.new(
       :provider => "HP",
       :version => :v2,
       :hp_access_key => ENV['HP_ACCESS_KEY'], 
       :hp_secret_key => ENV['HP_SECRET_KEY'],
       #:hp_auth_uri => "",
       :hp_tenant_id => ENV['HP_TENANT_ID'],
       :hp_avl_zone => "region-b.geo-1",
        )

#puts "connection: #{conn.inspect}"
#response = conn.list_servers
puts "########"
response = conn.list_servers_detail
#puts "#{response.body['images']}"                     # returns an array of image hashe
#puts "#{response.body['servers'][0]['image']}" 


class Notify_instances
    def initialize(name)
      @instance_name= name
    end
    def display_details()
      puts "Instance name #@instance_name"
    end
end


# For instance name display
$i = 0
#inst = Array.new(5,10)
while $i<2
inst=Notify_instances.new("#{response.body['servers'][$i]['name']}")

inst.display_details()
$i+=1
end


$data = Array.new(20)
$data = #{response.body['servers'][0]['created']}

#$data = Time.now
puts $data

if $data <= Time.now

        puts "Done"
else
        puts "Not Done"

end 

