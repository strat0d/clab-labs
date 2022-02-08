#!/bin/bash
#ce-cust1-r1 interfaces

# add mgmt vrf
ip link add dev mgmt type vrf table 100
ip link set dev eth0 master mgmt

# dum1
ip link add dev dum1 type dummy
ip link set dev dum1 up

