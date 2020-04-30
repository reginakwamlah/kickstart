#
# Cookbook:: kickstart
# Attributes:: default
#
# Copyright:: 2020, IBM Cloud IaaS Bedrock

# DHCP

default['bedrock']['dhcp']['domain-name'] = "100.220.81.170"
default['bedrock']['dhcp']['domain-name-server'] = "100.220.81.170"
default['bedrock']['dhcp']['subnet'] = "10.220.81.128"
default['bedrock']['dhcp']['netmask'] = "255.255.255.192"
default['bedrock']['dhcp']['routers'] = "10.220.81.191"
default['bedrock']['dhcp']['range-min'] = "10.220.81.21"
default['bedrock']['dhcp']['range-max'] = "10.220.81.120"
default['bedrock']['dhcp']['next-server'] = "10.220.81.191"
default['bedrock']['dhcp']['default-lease-time'] = 3600
default['bedrock']['dhcp']['max-lease-time'] = 7200;
default['bedrock']['dhcp']['pxe-filename'] = "/var/lib/netboot/pxelinux.cfg";
default['bedrock']['dhcp']['broadcast'] = "10.220.81.191"

# TFTP
