#!/bin/sh
# Setup hostname
echo $1 > /etc/hostname
echo "127.0.0.1 $1" >> /etc/hosts

# Generate locales (only en_US.UTF-8 for now)
sed -i -e '/en_US\.UTF-8/s/^# //g' /etc/locale.gen
locale-gen
update-locale LANG=en_US.UTF8

# Change plymouth default theme
plymouth-set-default-theme mobian

# Disable phosh on startup if package is installed
if [ -f /usr/bin/phosh-session ]; then
    systemctl enable phosh.service
fi

# Disable Cutie on startup if package is installed
if [ -f /usr/bin/cutie-ui-io ]; then
    systemctl disable cutie-ui-io.service
fi

# Mask services
systemctl mask mtp-configfs
systemctl mask batman