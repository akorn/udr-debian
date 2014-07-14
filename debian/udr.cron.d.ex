#
# Regular cron jobs for the udr package
#
0 4	* * *	root	[ -x /usr/bin/udr_maintenance ] && /usr/bin/udr_maintenance
