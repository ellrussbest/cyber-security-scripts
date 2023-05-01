# enable monitor mode

# the below command will discover all the wireless networks around me
# airodump-ng <name of wireless adapter>
airodump-ng mon0

# BSSID<mac address of the target network>
# PWR<signal strength/power of the network i.e. the higher the number the better the signal>
# Beacons<frames sent by the network in order to broadcast its existence and telling all the 
# wireless devices around it that it exists and it has this BSSID and it works on a paritcular channel
# . Even the hidden networks always send the Beacons>
# #Data<number of data packets>
# #/s number of data packets we collected
# CH<channel the network works on>
# MB<maximum speed supported by the network>
# ENC<encryption used by the network>
# CIPHER <cipher used in the network>
# AUTH <authentication used in the network>
# ESSID<names of the wireless networks>

# ##SNIFFING 5GHZ NETWORK
# airodump-ng --band a <name of wireless adapter>
airodump-ng --band a mon0

# the below will capture data on both 2.4 and 5ghz at the same time
airodump-ng --band abg mon0