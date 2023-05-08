#!/bin/bash

# MAC -> Media Access Control (permanent, physical and unique)
# each network card come with a specific MAC address
# changing mac address will allow yout to impersonate other devices
# you can be able to bypass filters, or connect to networks that only specific devices 
# with specific mac addresses can connect to


# list all the network interfaces available (both wireless and cable)
ifconfig

# use iwconfig when you only want to see wireless interfaces
iwconfig

# eth0 -> wired network
# ether -> mac address

# in order to change the mac address you first have to disable the interface
ifconfig <interface_name> down
ifconfig wlan0 down

# change the option that you want to change
ifconfig <interface_name> hw <option> <new mac address>
ifconfig wlan0 hw ether 00:11:22:33:44:55

# enable the interface
ifconfig <interface_name> up
ifconfig wlan0 up

# these are the steps that you should follow to when the mac address reverts back to original
# even without restarting the computer
vi /etc/NetworkManager/NetworkManager.conf 

# after opening this file, all you need to do is to paste
# the following lines of codes on the file

# the below lines tells the Network manager not to interfere with the value of the 
# mac address.

[device]
wifi.scan-rand-mac-address=no

[connection]
ethernet.cloned-mac-address=preserve
wifi.cloned-mac-address=preserve

# then restart the network manager for the changes to take effect
systemctl restart NetworkManager