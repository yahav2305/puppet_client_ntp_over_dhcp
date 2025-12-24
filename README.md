# puppet_client_ntp_over_dhcp

This module will set the system clock of an Arch device using an NTP server given over DHCP (DHCP port 42).

Local time can still be changed from the settings of the system, but each time a network change is detected (new interface connected, dhcp4 change, dhcp6 change) the time is re-synchronized to the NTP time server given over DHCP.

Script source can be found here: https://wiki.archlinux.org/title/NetworkManager#Dynamically_set_NTP_servers_received_via_DHCP_with_systemd-timesyncd

# Disclaimer
- This module has only been tested with an Arch install
- This module has been tested to work with ports that use [802.1x](https://en.wikipedia.org/wiki/IEEE_802.1X)
