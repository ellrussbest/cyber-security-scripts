#!/bin/bash

# it is worth noting that both WPA and WPA2 are similar
# the only difference is the encryption used to ensure the message integrity
# WPA uses TKIP, whereas WPA2 uses CCMP

#### LET'S TALK ABOUT A FEATURE THAT IF ENABLED AND MISCONFIGURED, CAN BE EXPLOITED TO RECOVER THE KEY
# WITHOUT HAVING TO CRACK THE ACTUAL ENCRYPTION
# THIS FEATURE IS CALLED WPS
# WPS ALLOWS DEVICES TO CONNECT TO THE NETWORK WITHOUT HAVING TO ENTER THE KEY FOR THE NETWORK
# THIS WAS MAINLY DESIGNED FOR PRINTERS, SMART TVS ETC.

# you can actually see WPS button on most wireless-enabled printers
# if this button is pressed and then you press the WPS button on the router, the printer will
# connect to the router without you having to enter the key
# the authentication here, is done using an eight-digit PIN
# think of this as a password mad up of only eight numbers and the length is only 8
# this actually gives us a small list of possible passwords.
# once we get this pin, it can be used to recover the actual WPA/WPA2 key

# for the above exploitation to work we need to have WPS enabled and it should be misconfigured i.e.
# it needs to be configured to use a normal PIN authentication and not Push Button Authentication.
# if push button authenticaiton is used, the router will refuse any PINs that we try unless the WPS
# button is pressed on the router