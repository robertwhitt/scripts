#!/bin/sh
#
# This is used to delete all existing printers. 
# Generally used as a "before" script in a policy
# when remapping printers.

lpstat -p | cut -d' ' -f2 | xargs -I{} lpadmin -x {}

exit 0
