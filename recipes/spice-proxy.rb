#
# Cookbook Name:: modularit-ovirt
# Recipe:: spice-proxy
#
# Copyright 2016, CanaryTek
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

# packages
package "squid" do
  action :install
end

template "/etc/squid/squid.conf" do
  source "squid.conf.erb"
end

service "squid" do
  action [ :enable, :start ]
end