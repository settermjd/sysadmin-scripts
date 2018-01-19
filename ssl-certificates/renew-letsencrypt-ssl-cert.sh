#!/bin/bash

#
# This script automates the process of renewing the SSL certificates via LetsEncrypt.
# copyright (c) 2017-2018 Matthew Setter <matthew@matthewsetter.com>
#
cd /opt/letsencrypt/

# Renew all certificates that are due for renewal
if echo $( ./letsencrypt-auto renew -n ) | grep -xq 'No renewals were attempted.'
then 
	# Restart NGINX after the renewal to read-in the new certificates
	service nginx restart 
else 
	echo 'Not restarting NGINX as no certificates have been renewed'
fi;
