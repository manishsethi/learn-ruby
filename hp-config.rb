require 'rubygems'
require 'fog'
require 'date'
require 'time'

conn = Fog::Compute.new(
       :provider => "HP",
       :version => :v2,
       :hp_access_key => ENV['HP_ACCESS_KEY'], 
       :hp_secret_key => ENV['HP_SECRET_KEY'],
       #:hp_auth_uri => "",
       :hp_tenant_id => ENV['HP_TENANT_ID'],
       :hp_avl_zone => "region-b.geo-1",
        )

  response = conn.list_servers_detail
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
  while $i<2
   inst=Notify_instances.new("#{response.body['servers'][$i]['name']}")
   inst.display_details()
   $i+=1
  end
 
  # For instance creation
  $j = 0 
  while $j<2
   puts "Checking #{$j} instances "
   puts Time.parse("#{response.body['servers'][$j]['created']}")
   t1 = Time.parse("#{response.body['servers'][$j]['created']}") 
   t2 = Time.now
#  puts t1
#  puts t2
   # standardize the time and date
   date1 = (t1.year + t1.mon + t1.day)
   puts date1
   date2 = (t2.year + t2.mon + t2.day)
   puts date2
   if date1 == date2 then
    time1 = (t1.hour * 60 * 60 + t1.min * 60 + t1.sec)
#   puts time1
    time2 = (t2.hour * 60 * 60 + t2.min * 60 + t2.sec)
#   puts time2
    if (time2 - time1) <= 1800 then
     system("ruby ms-email.rb")
    end
   end 
   $j += 1
  end
