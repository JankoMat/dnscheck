#! /bin/bash
domain=${1}
echo
echo "---------Direct results, propagation not considered---------"
ns=$(whois $domain | grep -i name | grep -i server | cut -d : -f 2 | awk '{print $1}' | head -1)
echo "Nameserver:"
echo $ns
command dig @8.8.8.8 $ns +short
echo "A record:"
command dig @$ns $domain +short
echo "www:"
command dig @$ns "www.$domain" +short
echo "MX:"
command dig @$ns MX $domain +short
echo
echo "---------Propagated records---------"
echo "A record:"
command dig @8.8.8.8 $domain +short
echo "www:"
command dig @8.8.8.8 "www.$domain" +short
echo "MX:"
command dig @8.8.8.8 MX $domain +short
