airdoump-ng --bssid <bssid of target network> --channel <channel of target network> --write <to the output file> <name of the wireless adapter in monitor mode>
airodump-ng --bssid F8:23:B2:B9:50:A8 --channel 2 --write test mon0

# .cap file -> contains the data that we captured during the monitor period
# and it will contain everything that was sent to and from the target network network
# e.g. urls, chat messages, usernames, passwords etc.