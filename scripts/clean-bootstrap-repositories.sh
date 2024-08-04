#!/bin/bash

# Remove extrepos
rm -f /etc/apt/trusted.gpg.d/droidian-bootstrap.gpg

# Nuke /etc/apt/sources.list
> /etc/apt/sources.list

# Drop eventual dummy file from pre-overlay
rm -f /.dummy

# Finally update again
apt update

exit 0
