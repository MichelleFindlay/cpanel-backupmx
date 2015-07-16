cPanel-BackupMX
=====================
Why do I need cPanel BackupMX?
- cPanel BackupMX acts as a way of automating the ability to turn your cPanel DNS only servers in to backup mail exchangers are no further cost to yourself. This gives you the added advantage that you can be assured your e-mails - - wont simply just go missing if you have downtime on your web boxes as cPanel do not currently offer the ability to split the mail role from the web server role.

Is this not already built in to cPanel?
- No it is not, cPanel have not enabled this within the cPanel DNS only role yet, although it would be simple to rollout there is a feature request here -
- https://features.cpanel.net/topic/backup-mx-service-on-cpanel-dns-only

What does it do?
This package is made up of three scripts -
- One that operates on the Web server containing your hosting packages.
- A cron job that collates all of your servers in to a single downloadable list for all of your cPanel DNS Only servers.
- A set of cron jobs to configure your cPanel DNS only box to act as a Backup Mail Exchanger and download a copy of all your domain names to verify it is a legit request.

Prerequisites
- Webspace with FTP Access for you to Sync your domains to with ability to run bash scripts in Cron to merge the domains from all of your servers.
- a cPanel DNS Only Server
- A fully licensed installation of cPanel on a VPS or Dedicated Server

Change Log
- The change log can be found at the below URL:
- https://raw.githubusercontent.com/MichaelFindlay/cpanel-backupmx/master/cpanel-backupmx.changelog.txt