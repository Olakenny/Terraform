#!/bin/bash
# below command download and install apache web server

echo "#########################################"      
echo "installing apached httpd, wget and unzip"       
echo "#########################################"      
sudo yum install wget unzip httpd -y > /dev/null      
echo "starting apache httpd web server"
echo "#########################################"      
sudo systemctl start httpd
echo "#########################################"      
echo "enabling apache httpd web server"
echo "#########################################"      
sudo systemctl enable httpd
echo "#########################################"      
echo "checking apache httpd web server status"        
echo "#########################################"      
sudo systemctl status httpd

# creating a dir for hosting web server in tmp dir    
sudo mkdir /tmp/web
cd /tmp/web
# download website template from tooplate homepage    
echo "#########################################"
echo "downlaoding web templated from tooplate dir"
echo "#########################################"
sudo wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip
# extract the files from the zip files
echo "#########################################"
echo "extracting the files into /tmp/web dir"
echo "#########################################"
sudo unzip 2117_infinite_loop.zip > /dev/null
sudo rm -rf 2117_infinite_loop.zip
# move the files from the /tmp/web dir to apache home dir
sudo mv 2117_infinite_loop/* /var/www/html
# restart apache web server
echo "#########################################"
echo "starting apache httpd web server"
echo "#########################################"
sudo systemctl restart httpd