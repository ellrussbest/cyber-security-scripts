:'
For our computer to act as a fake access point, we need to do some configurations e.g.
1. wireless interface to broadcast the signal
2. Know when a client is making a response, fetch the response from the internet and 
    route it back to the correct client
3. we are going to use mana-toolkit to automatically configure nad create fake Access point, 
    automatically sniff data, and automatically bypass https
4. Mana has 3 main start scripts:
 - start-noupstream.sh -> starts fake AP with no internet access
 - start-nat-simple.sh -> starts fake AP with internet access
 - start-nat-full.sh -> starts fake AP with internet access, and automatically 
    starts sniffing data, bypass https
'

:'
Network setting to have on your Kali machine
Set it to use a NAT network
wireless adapter should be in managed mode, and not connected to any network
Now modify Mana settings

gedit /etc/mana-toolkit/hostapd-mana.conf

one of the modification is changing the interface to suit your interface
ssid=The network name that you want to give your fake access point


the next file that we will need to modify is the start script

gedit /usr/share/mana-toolkit/run-man/start-nat-simple.sh

we need to modify the upstream interface
- this is the interface that has internet access e.g. eth0, etc

phy -> the interface that is going to broadcast the signal this will be your wireless adapter.
'

bash /usr/share/mana-toolkit/run-mana/start-nat-simple.sh