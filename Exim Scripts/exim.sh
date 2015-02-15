# # # # # # # # # # # # # #
#     cpanel-backumx      #
#          By             #
#   Michael J K Findlay   #
#       mf@g33k.ws        #
#          v1.0           #
# # # # # # # # # # # # # #

# Read Me
# https://raw.githubusercontent.com/MichaelFindlay/cpanel-backupmx/master/README.md

# Change Log
# https://raw.githubusercontent.com/MichaelFindlay/cpanel-backupmx/master/cpanel-backupmx.changelog.txt

# Purpose of File and actions
# This script takes the preconfigured exim file in your root directory apply this to the one exim is running with a restart of the services. This is due to the fact the cPanel DNS only server has no Exim editor and will discard the changes required to run in a backup MX mode at random intervals during updates.

# Copy the configuration
cp /root/exim.conf /etc/exim.conf

# Restart exim services
service exim restart