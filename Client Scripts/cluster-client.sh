# Remove existing files for both mx backup hosts, along with temp file
rm /etc/backupmxhosts
rm mxbackup.txt

# Downloads the new list of domains
wget http://mailcluster.yourdomain.com/mxbackup.txt

# Relocates it to the mxbackup hosts for Exim
mv mxbackup.txt /etc/backupmxhosts