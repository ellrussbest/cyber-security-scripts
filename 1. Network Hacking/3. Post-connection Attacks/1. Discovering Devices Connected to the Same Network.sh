:'
# post-connection attacks
- information gathering
- you cannot hack into a system if you don't have information about it
- if you're connected to a network and one of the devices connected to the network is your target:
- Now for you to hack into that target you need to discover all the connected clients to this network, get their mac address, IP address, and then from there maybe try to gather more information or run some attacks in order to gain access to your target.
- there are a number of programs that will do this for you e.g.
    - NMAP
    - NetDiscover
- 
'

# using netdiscover to quickly map the network we're connected to
netdiscover -r <range of network>
netdiscover -r 10.0.2.1/24

# the above is a way of specifying the IP address for the whole subnet

:'
- you can also use NMAP
- form an ip range it can discover
    1. open ports
    2. running programs/services on the open ports
    3. operating system
    4. connected clients in a network
    5. computer names
    6. bypass security
    7. bypass firewalls
    8. We can also use NMAP to gain access using code execution vulnerabilities
zenmap is the GUI of nmap
'

:'
- fun fact:
    - by default iOS devices do not have an ssh server.
    - usually when you jailbreak the phone, it will automatically install
    - an ssh server. And the password of that server is set to alpine
    - so it is always worth a try to connect with a vulnerable phone like this with
    - the default password.
    e.g.
'

ssh root@192.168.1.12 