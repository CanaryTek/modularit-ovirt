#
# Author:: Kuko Armas
# Cookbook Name:: modularit-ovirt
# Attribute:: default
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

# oVirt release package
default['ovirt']['release_package'] = "ovirt-release35"
default['ovirt']['release_file'] = "ovirt-release35.rpm"
default['ovirt']['download_url'] = "http://resources.ovirt.org/pub/yum-repo/#{node['ovirt']['release_file']}"

# Packages for node
default['ovirt']['node']['packages'] = %w[ovirt-hosted-engine-setup screen glusterfs-server nfs-utils vdsm-gluster system-storage-manager xauth]

# Packages for guest
default['ovirt']['guest']['packages'] = %w[ovirt-guest-agent]
