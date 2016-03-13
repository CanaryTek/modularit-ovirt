#
# Cookbook Name:: modularit-ovirt
# Recipe:: node
#
# Copyright 2013, CanaryTek
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Include default
include_recipe "modularit-ovirt::default"

# Download oVirt release RPM
remote_file "#{Chef::Config[:file_cache_path]}/#{node['ovirt']['release_file']}" do
  file="#{node['ovirt']['download_url']}"
  Chef::Log.info("Downloading #{file}")
  source file
  action :create_if_missing
end

# oVirt Release package
rpm_package node['ovirt']['release_package'] do
  source "#{Chef::Config[:file_cache_path]}/#{node['ovirt']['release_file']}"
  action :install
end

# node packages
package node['ovirt']['node']['packages'] do
  action :install
end

rasca_object "SecPkgChk-ovirt-node" do
  check "SecPkgChk"
  format "ruby"
  content '{ 
    "qemu-kvm" => { :package => "qemu-kvm", :ports => [ "TCP/ANY" ] },
    "vdsm" => { :package => "vdsm", :ports => [ "TCP/54321" ] },
    "sshd" => { :package => "openssh-server", :ports => [ "TCP/22", "TCP/2223" ] },
    "libvirtd" => { :package => "libvirt", :ports => [ "TCP/16514" ] }
  }'
end

