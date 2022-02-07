#!/bin/bash

# add mgmt vrf
ip link add dev mgmt type vrf table 100
ip link set dev eth0 master mgmt
