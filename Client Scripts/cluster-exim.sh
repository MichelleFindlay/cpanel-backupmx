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

# Entering your settings
# You will then need to enter in your IP Address to variable _IP and the hostname of your server in to _HOSTNAME. Once you have done this 
#
# To enter the settings to enable exim mail server to handle backup domains you will need to enter this in to the crontab using the following entry -
# Ensure Exim has correct config
# 0 */30 * * * sh /root/cluster-exim.sh > /dev/null 2>&1
#
# This will run every 30 minutes ensuring within 30 minutes of a cPanel update to your server your mail cluster will be operational again.

# Sync Settings
_IP='XX.XX.XX.XX' # Change the IP Address but leave the local_interfaces = at the start.
_HOSTNAME='subdomain.domain.com' # Change the hostname but leave the primary_hostname = at the start.

# DO NOT EDIT BELOW THIS LINE #
ORGIP='local_interfaces = XX.XX.XX.XX'
ORGHOST='primary_hostname = unset.hostname.com'

# Copies the template
cp exim.conf.template exim.conf.edit

# Changes the IP to one specified in the configuration above.
sed -i "s/$ORGIP/local_interfaces = $_IP/" /root/exim.conf.edit

# Changes the hostname to one specified in the configuration above.
sed -i "s/$ORGHOST/primary_hostname = $_HOSTNAME/" /root/exim.conf.edit

# Copy the configuration
cp /root/exim.conf.edit /etc/exim.conf

# Removes the working file
rm -f /root/exim.conf.edit

# Restart exim services to apply configuration
/etc/init.d/exim restart