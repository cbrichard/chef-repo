default["apache"]["sites"]["ec2-54-193-55-115"] = { "site_title" => "Chris's site comming soon", "port" => 80, "domain" => "ec2-54-193-55-115.us-west-1.compute.amazonaws.com" } 
default["apache"]["sites"]["ec2-54-193-45-46"] = { "site_title" => "Chris's site comming soon", "port" => 80, "domain" => "ec2-54-193-45-46.us-west-1.compute.amazonaws.com" }

default["author"]["name"] = "chris"

case node["platform"]
when "centos"
    default["apache"]["package"] = "httpd"
when "ubuntu"
    default["apache"]["package"] = "apache2"
end

