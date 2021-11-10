# This script adds the Blackarch repo
# Taken from https://blackarch.org/downloads.html#install-repo
# the 2021-11-10

set -e

# Fetch install script
curl -O https://blackarch.org/strap.sh
echo 46f035c31d758c077cce8f16cf9381e8def937bb strap.sh | sha1sum -c

# Add blackarch
chmod +x strap.sh
sudo ./strap.sh

# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
sudo pacman -Syu

# Install some common dependencies
# `xorg-xwayland` and `jre` are needed to run `burpsuite` GUI
sudo pacman -S \
	burpsuite \
	gobuster \
	hash-identifier \
	john \
	jre11-openjdk \
	metasploit \
	xorg-xwayland

# Needed for `burpsuite` GUI
sudo archlinux-java set java-11-openjdk
