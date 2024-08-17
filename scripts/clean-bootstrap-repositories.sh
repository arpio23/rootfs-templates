#!/bin/bash

# Remove extrepos
rm -f /etc/apt/trusted.gpg.d/droidian-bootstrap.gpg

# Nuke /etc/apt/sources.list
> /etc/apt/sources.list

# Drop eventual dummy file from pre-overlay
rm -f /.dummy

# Record selected snapshot
cat > /etc/apt/apt.conf.d/90-droidian-snapshot <<EOF
Acquire::Droidian::Version "${1}";
EOF

# Finally update again
apt update

exit 0
