#!/bin/sh
#
# This is used to kickstart ARD for the user entered into parameter $4
# In the "Options" of the script we re-label parameter 4 as "ARD Username"

# Allow access for the user specified in parameter 4 in options.
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -privs -all -users $4 sleep 2

# Enable new access privileges 
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -specifiedUsers sleep 2

# Restart ARD Agent
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent

exit 0
