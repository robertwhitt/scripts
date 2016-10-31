#!/bin/sh
#
# This will attempt to  map a printer based on the following parameters set in a policy. 
#
# $4 = Printer Name. Do not use spaces in the name.
# $5 = Printer Location. The location allows spaces.
# $6 = IP address or FQDN/queue of printer. If direct IP printer just use an IP Address. If printing
# to a print server use a FQDN with a print queue (i.e. some.printer.edu/queuename)
# $7 = Name of PPD. Drivers need to be installed first. This assumes the PPDs are installed
# in the default location "/Library/Printers/PPDs/Contents/Resources"
# $8 = Set Default. If the user enters "yes" then make this the default printer

# Map the printer
lpadmin -p $4 -L "$5" -E -o printer-is-shared=false -v lpd://$6 -P /Library/Printers/PPDs/Contents/Resources/"$7"

# If the policy is configured with this as "yes", make it the default printer.
# Note: you may also need to disable the "UseLastPrinter" for this to work. We do this as part of a separate policy.
# sudo defaults write /Library/Preferences/org.cups.PrintingPrefs UseLastPrinter -bool False

if [ $8 = "yes" ]; then
lpadmin -d $4
fi
