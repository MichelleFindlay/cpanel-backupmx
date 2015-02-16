cPanel-BackupMX (Currently in testing)
=====================
What does this script do?
- This set of bash and automation scripts will assist you with configuring your cPanel DNS only installations to act as backup e-mail servers. It will support multiple full cPanel installs all syncing to one web space which merges and centrally manages all of the servers domains in to a single list downloaded by each of your DNS Servers.

Change Log
- The change log can be found at the below URL:
- https://raw.githubusercontent.com/MichaelFindlay/cpanel-backupmx/master/cpanel-backupmx.changelog.txt

Why did you create this script?
- I had a need myself within my company utilising 5 DNS Servers world wide and cPanel web servers to be able to provide customers with a backup MX record on each of these for redundancy. I created these scripts for my own use but figured I would share them with the world to assist other cPanel sysadmins.

Prerequisites
- Webspace with FTP Access for you to Sync your domains to with ability to run bash scripts in Cron to merge the domains from all of your servers.
- a cPanel DNS Only Server
- A fully licensed installation of cPanel on a VPS or Dedicated Server

Steps
- a. Create a web space for example mailcluster.mycompany.co.uk creating FTP logons for each of your servers giving them access to the root directory of the website.
- b. You will now need to then follow the steps in the RTFM.txt located inside the Web folder to configure the webspace.
- c. Copy the Master Scripts to your cPanel web servers in the location /root/ and then follow the instructions inside RTFM.txt.
- e. Once the scripts are running, copy the contents of Client Scripts to your cPanel DNS Only Servers inside the /root/ directory and then follow the steps in the RTFM.txt.
