#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

r_ip=$(run show dhcp client leases | grep router | awk '{ print $3 }');
iptv_static=$(echo "set protocols static route 213.75.112.0/21 next-hop $r_ip")

configure
delete protocols static route 213.75.112.0/21
eval $iptv_static
commit
save
exit
