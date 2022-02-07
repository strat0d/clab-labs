#!/bin/bash
#pe-r1 interfaces
# add mgmt vrf
ip link add dev mgmt type vrf table 100
ip link set dev mgmt up
ip link set dev eth0 master mgmt

# dummy intfs
ip link add dev dum0 type dummy
ip link set dev dum0 up

# cust1 vrf + vni101 vxlan
ip link add cust1 type vrf table 101
ip link add br101 type bridge
ip link add vxlan101 type vxlan id 101 dev dum0 dstport 4789
ip link set dev vxlan101 master br101
ip link set dev eth2 master br101
ip link set dev br101 master cust1
ip link set dev vxlan101 up
ip link set dev br101 up
ip link set dev cust1 up
