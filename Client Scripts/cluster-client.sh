# # # # # # # # # # # # # #
#     cpanel-backumx      #
#          By             #
#   Michael J K Findlay   #
#       mf@g33k.ws        #
#          v1.0           #
# # # # # # # # # # # # # #

# Purpose of File and actions
# This shell script will copy down the list of domains to be allowed for Backup MX relaying, this is held centrally on a hosting package or server where you can merge in all of your servers domains to a single text formatted file. This provides the up to date list and ensures your newly added domains function in the cluster.

# Read Me
# https://raw.githubusercontent.com/MichaelFindlay/cpanel-backupmx/master/README.md

# Change Log
# https://raw.githubusercontent.com/MichaelFindlay/cpanel-backupmx/master/cpanel-backupmx.changelog.txt

# Entering your settings
# You will need to enter the hostname of the site where you store the entitled domains in to the MASTER or MASTERSSL configuration settings.
#
# To enter the settings to enable exim mail server to handle backup domains you will need to enter this in to the crontab using the following entry -
# Ensure Exim has correct config
#
# # Mail Cluster Configuration
# 0 */5 * * * sh /root/cluster-client.sh > /dev/null 2>&1
#
# This will run every 5 minutes pulling a full list of your hosted / cPanel domains who are entitled to use the backup mail servers.

# Sync Settings
MASTER='mailcluster.yourdomain.com' # Enter the hostname of the webspace
MASTERSSL='mailcluster.yourdomain.com' # Enter the SSL hostname of the webspace

# DO NOT EDIT BELOW THIS LINE #

# Removes the old file
rm -f /root/mxbackup

# HTTP Fetch list of domains
/usr/bin/wget -O /root/mxbackup http://$MASTER/get/

# HTTPS Fetch list of domains
# To enable HTTPS for getting list of domains please comment out the HTTP section. And then uncomment the below line.
#/usr/bin/wget -O /root/mxbackup http://$MASTERSSSL/get/

# Relocates it to the mxbackup hosts for Exim
mv -f mxbackup /etc/backupmxhosts