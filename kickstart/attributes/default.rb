#
# Cookbook:: kickstart
# Attributes:: default
#
# Copyright:: 2020, IBM Cloud IaaS Bedrock

# DHCP

default['bedrock']['dhcp']['domain-name'] = "0.0.0.0"
default['bedrock']['dhcp']['domain-name-server'] = "0.0.0.0"
default['bedrock']['dhcp']['subnet'] ="0.0.0.0"
default['bedrock']['dhcp']['netmask'] = "0.0.0.0"
default['bedrock']['dhcp']['routers'] = "0.0.0.0"
default['bedrock']['dhcp']['range-min'] = "0.0.0.0"
default['bedrock']['dhcp']['range-max'] = "0.0.0.0"
default['bedrock']['dhcp']['next-server'] = "0.0.0.0"
default['bedrock']['dhcp']['default-lease-time'] = 3600
default['bedrock']['dhcp']['max-lease-time'] = 7200;
default['bedrock']['dhcp']['pxe-filename'] = "/var/lib/netboot/pxelinux.cfg";
default['bedrock']['dhcp']['broadcast'] = "0.0.0.0"

# TFTP
