# for us to be able to capture any packets that are sent within our reach,
# we need to change our interface from managed to MONITOR mode

# as usual before we can change the options on our interface, we have to disable it
ifconfig wlan0 down

# we have to run a command that will kill all the process that would interfere with using
# our network interface
airmon-ng check kill

# WE WILL ONLY NEED TO BE IN MONITOR MODE WHEN WE ARE RUNNING PRECONNECTION ATTACKS
# i.e. the attacks that do not require us to connect to any network.
# iwconfig <interface_name> mode monitor
iwconfig wlan0 mode monitor

# enable the interface
ifconfig wlan0 up

# for us to go back to the mananged mode we need to:
sudo iwconfig <interface name> mode managed

# run iwconfig and check the mode
# the mode should now be updated to monitor
# the monitor mode will now enable us to capture any packets that are within our range
# we can use this mode to sniff packets, analyze them and even break into networks


# enabling monitor mode using airmon-ng
# we first need to install aircrack-ng
sudo apt-get install aircrack-ng

ifconfig wlan0 down
airmon-ng check kill
# this will change the interface from wlan0 to wlan0mon
airmon-ng start wlan0
iwconfig

# for us to go back to the managed mode we need to
sudo airmon-ng stop <interface>