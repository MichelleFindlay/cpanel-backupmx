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

# Remove existing files for both mx backup hosts, along with temp file
rm /etc/backupmxhosts
rm mxbackup.txt

# Downloads the new list of domains
wget http://mailcluster.yourdomain.com/mxbackup.list

# Relocates it to the mxbackup hosts for Exim
mv mxbackup.list /etc/backupmxhosts