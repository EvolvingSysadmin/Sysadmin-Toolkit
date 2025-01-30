# Linux hardening

* Implement GRUB bootloader password: grub2-mkpasswd-pbkdf2
* LUKS Linux Unified Key Setup
* Show firewall status: sudo ufw status
* Hardening SSH:
  * Disable remote login as root; force login as non-root users.
  * Disable password authentication; force public key authentication instead.
  * Config file is: /etc/ssh/sshd_config
* Hardening users
  * Disable root and use a different account for administration
  * Enforce strong password policy using libpwquality
  * Disable unused accounts
  * cat /etc/group to show group membership
* Harden software/services
  * Disable unnecessary services
  * Block unneeded network ports
  * Avoid legacy protocols
  * Remove identification strings
* Automatic updates of kernal/software
* Ubuntu/debian updates:
  * apt update to download package information from the configured sources
  * apt upgrade to install available upgrades for all packages from the configured sources
* RedHat/Fedora updates
  * dnf update on newer releases (Red Hat Enterprise Linux 8 and later)
  * yum update on older releases (Red Hat Enterprise Linux 7 and earlier)