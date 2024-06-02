curl -o /usr/bin/power https://cdn.jsdelivr.net/gh/1guaishow/atx@main/power
curl -o /usr/bin/restart https://cdn.jsdelivr.net/gh/1guaishow/atx@main/restart
curl -o /usr/bin/sensor https://cdn.jsdelivr.net/gh/1guaishow/atx@main/sensor
sudo mv /etc/kvmd/override.yaml /etc/kvmd/override.yaml.bak
curl -o /etc/kvmd/override.yaml https://cdn.jsdelivr.net/gh/1guaishow/atx@main/override.yaml
curl -o setup https://cdn.jsdelivr.net/gh/1guaishow/atx@main/setup
echo "kvmd ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/custom_commands > /dev/null
echo 'SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", SYMLINK+="kvmATX"' | sudo tee /etc/udev/rules.d/98-kvmatx.rules > /dev/null
chmod +x setup
chmod +x /usr/bin/sensor
chmod +x /usr/bin/power
chmod +x /usr/bin/restart
echo "@reboot /usr/bin/sensor" | sudo crontab -u root -
 ./setup