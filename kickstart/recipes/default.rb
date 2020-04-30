#
# Cookbook:: kickstart
# Attributes:: default
#
# Copyright:: 2020, IBM Cloud IaaS Bedrock

pkgs = [
  'httpd',
  'syslinux',
  'dhcp-server',
  'rsync',
  'tftp-server',
  'vsftpd',
  'xinetd',
  'mod_ssl'
]

pkgs.each do |pkg|
  package(pkg) do
    action :install
  end
end

directory('/home/kickstart/') do
  owner 'root'
  group 'root'
  mode '0775'
end

directory('/var/log/dhcpd') do
  owner 'root'
  group 'root'
  mode '0775'
end


directory('/var/lib/tftpboot') do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

directory('/var/lib/tftpboot/pxelinux.cfg') do
  owner 'apache'
  group 'apache'
  mode '0775'
  recursive true
end

template('/var/lib/tftpboot/pxelinux.cfg/default') do
  source '/var/tftpboot/pxelinux.cfg/default.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(


  )
end

directory('/var/lib/tftpboot/networkboot') do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

template('/var/ftp/pub/centos8.cfg') do
  source '/var/ftp/pub/centos8.cfg.erb'
  owner 'root'
  group 'root'
  mode '0644


template('/etc/xinetd/tftp') do
  source '/etc/xinet.d/tftp.erb'
  owner 'root'
  group 'root'
  mode '0644
  variables (
            :socket_type => node['bedrock']['tftp']['socket_type'],
            :protocol => node['bedrock']['tftp']['protocol'],
            :protocol => node['bedrock']['tftp']['wait'],
            :user => node['bedrock']['tftp']['user'],
            :server => node['bedrock']['tftp']['server'],
            :several_args => node['bedrock']['tftp']['several_args'],
            :disable => node['bedrock']['tftp']['disable'],
            :per_source => node['bedrock']['tftp']['per_source'],
            :cps01 => node['bedrock']['tftp']['cps01'],
            :cps02 => node['bedrock']['tftp']['cps02'],
            :flags => node['bedrock']['tftp']['flags']
  )
end

template('/etc/vsftpd/vsftpd.conf') do
  source '/etc/vsftpd/vsftpd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables (
            :anonymous_enable => node['bedrock']['vsftpd']['anonymous_enable'],
            :local_enable => node['bedrock']['vsftpd']['local_enable'],
            :write_enable => node['bedrock']['vsftpd']['write_enable'],
            :local_mask => node['bedrock']['vsftpd']['local_umask'],
            :dirmessage_enable => node['bedrock']['vsftpd']['dirmessage_enable'],
            :connect_from_port_20 => node['bedrock']['vsftpd']['connect_from_port_20'],
            :xferlog_std_format => node['bedrock']['vsftpd']['xferlog_std_format'],
            :listen => node['bedrock']['vsftpd']['listen'],
            :listen_address => node['bedrock']['vsftpd']['listen_address'],
            :pam_service_name => node['bedrock']['vsftpd']['pam_service_name'],
            :userlist_enable => node['bedrock']['vsftpd']['userlist_enable'],
            :tcp_wrappers => node['bedrock']['vsftpd']['tcp_wrappers'],
            :ftpd_banner => node['bedrock']['vsftpd']['ftpd_banner']
  )
end

template('/etc/dhcp/dhcpd.conf') do
  source '/etc/dhcp/dhcpd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables (
            :domainname => node['bedrock']['dhcp']['domain-name'],
            :domainnameserver => node['bedrock']['dhcp']['domain-name-server'],
            :subnet => node['bedrock']['dhcp']['subnet'],
            :netmask => node['bedrock']['dhcp']['netmask'],
            :router => node['bedrock']['dhcp']['routers'],
            :rangemin => node['bedrock']['dhcp']['range-min'],
            :rangemax => node['bedrock']['dhcp']['range-max'],
            :nextserver => node['bedrock']['dhcp']['next-server'],
            :defaultleasetime => node['bedrock']['dhcp']['default-lease-time'],
            :maxleasetime => node['bedrock']['dhcp']['max-lease-time'],
            :pxefilename => node['bedrock']['dhcp']['pxe-filename'],
            :broadcast => node['bedrock']['dhcp']['broadcast']
  )
end

file "/var/lib/tftpboot/pxelinux.0" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/usr/share/syslinux/pxelinux.0").read
  action :create
end

file "/var/lib/tftpboot/menu.32" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/usr/share/syslinux/menu.c32").read
  action :create
end

file "/var/lib/tftpboot/memdisk" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/usr/share/syslinux/memdisk").read
  action :create
end

file "/var/lib/tftpboot/mboot.c32" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/usr/share/syslinux/mboot.c32").read
  action :create
end

file "/var/lib/tftpboot/chain.32" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/usr/share/syslinux/chain.32").read
  action :create
end
