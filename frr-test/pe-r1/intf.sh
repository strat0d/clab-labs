#!/bin/bash
#pe-r1 interfaces
# add mgmt vrf
ip link add dev mgmt type vrf table 100
ip link set dev mgmt up
ip link set dev eth0 master mgmt

# dummy intfs
ip link add dev dum0 type dummy
ip link set dev dum0 mtu 1550
ip link set dev dum0 up


# cust1 vrf + vni101 vxlan
ip link add cust1 type vrf table 101
ip link add br101 type bridge
ip link add vxlan101 type vxlan id 101 local 198.18.1.1 dstport 4789
ip link set dev vxlan101 mtu 1500
ip link set dev br101 mtu 9500
ip link set dev vxlan101 master br101
ip link set dev eth2 master br101
ip link set dev br101 master cust1
ip link set dev vxlan101 up
ip link set dev br101 up
ip link set dev cust1 up

ip addr add 192.168.1.0/31 dev br101

# cust2 crf + vni101 vxlan
ip link add cust2 type vrf table 102
ip link add br102 type bridge
ip link add vxlan102 type vxlan id 102 dev dum0 dstport 4789
ip link set dev vxlan102 mtu 1500
ip link set dev br102 mtu 9500
ip link set dev vxlan102 master br102
ip link set dev eth3 master br102
ip link set dev br102 master cust2
ip link set dev vxlan102 up
ip link set dev br102 up
ip link set dev cust2 up

ip addr add 192.168.2.0/31 dev br102
