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
#puts "########"
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

# For instance creation 
data = Array.new(20)
data = "#{response.body['servers'][0]['created']}"

#$data = Time.now
#puts Date.parse(Time.now.to_s)
puts DateTime.parse(data).to_date.to_s
puts data[0..9]
#puts DateTime.parse(data).to_time.to_s
if  DateTime.parse(data).to_date.to_s ==  data [0..9]
  puts "Date Matched "
else
  puts "not done"
end
