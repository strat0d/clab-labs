#!/bin/bash

# add mgmt vrf
ip link add dev mgmt type vrf table 100
ip link set dev mgmt up
ip link set dev eth0 master mgmt

# add dum0 intf
ip link add dev dum0 type dummy
ip link set dev dum0 up
