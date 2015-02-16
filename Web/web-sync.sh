# # # # # # # # # # # # # #
#     cpanel-backumx      #
#          By             #
#   Michael J K Findlay   #
#       mf@g33k.ws        #
#          v1.0           #
# # # # # # # # # # # # # #

# Purpose of File and actions
# This script runs as part of a cron on the web space, collating together the domain names and hosts submitted by your cPanel web servers. So that when the DNS Servers fetch the list its a single file for all of the domains.

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
#
# This will run every 4 minutes pulling a full list of your hosted / cPanel domains who are entitled to use the backup mail servers.

# Setup
# a. Upload the web-sync.sh in the folder above your public web folder.
# b. Add the following cron job to your server via cPanel or via SSH
# # Mail Cluster Configuration
# 0 */5 * * * sh /home/webspace/web-sync.sh > /dev/null 2>&1
# 
# c. Prior to adding to any servers or clients please allow 10 minutes for the first one to run after 5 minutes.

# Merges the lists together
cat /home/webspace/public_html/* > /home/webspace/public_html/get/mxbackup