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
# This script takes the list of domains located on your web server and then uploads to a central location where it is merged and then converted as to support multiple cPanel Web Servers.

# Entering your settings
# To enter the settings to sync the domains on your web server, please enter the hostname, username and password of your ftp server along with a public readable web location. The final setting is the name of your server, this must be unique and only contain numerical or alphabetical. 

# Sync Settings
HOST='FTP HOST' # FTP HOST
USER='FTP USER' # FTP USER
PASSWD='FTP PASSWORD' # FTP Password
DIRECT='servers' # Change to public folder of your FTP web space, in this case 'www' or 'public_html' is correct on cPanel Servers
SERVER='ServerName' # Your servers canonical identifier (Must be unique and have no spaces, symbols or special characters)

# DO NOT EDIT BELOW THIS LINE

# Removing old text file
rm -f /root/$SERVER.server

# Copy over new list of domains to the text file
grep ": $1" /etc/userdomains | cut -d: -f1 > /root/$SERVER.server

# Uploads the file to your FTP Server
ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
cd $DIRECT
put $SERVER.server
quit
END_SCRIPT
exit 0