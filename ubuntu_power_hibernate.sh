#!/usr/bin/env bash
set -e
set -x
# https://help.ubuntu.com/16.04/ubuntu-help/power-hibernate.html
cat > polkit <<EOF
[Re-enable hibernate by default in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes
[Re-enable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate;org.freedesktop.login1.handle-hibernate-key;org.freedesktop.login1;org.freedesktop.login1.hibernate-multiple-sessions;org.freedesktop.login1.hibernate-ignore-inhibit
ResultActive=yes
EOF
cat polkit | sudo tee -a /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
rm polkit
