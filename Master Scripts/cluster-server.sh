# Removing old text file
rm /home/%username%/public_html/mxbackup.txt


# Copy over new list of domains to the text file
grep ": $1" /etc/userdomains | cut -d: -f1 > /home/%username%/public_html/mxbackup/mxbackup.txt