#
# Cookbook Name:: modularit-ovirt
# Recipe:: engine
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

include_recipe "modularit-ovirt::guest"
include_recipe "modularit-ovirt::spice-proxy"
include_recipe "modularit-ovirt::backup"

rasca_object "SecPkgChk-ovirt-chef" do
	check "SecPkgChk"
	format "ruby"
	content '{
		"ovirt-web" => { :package => "ovirt", :ports => [ "TCP/6100" ] },
		"ovirt-fen" => { :package => "ovirt", :ports => [ "UDP/7410" ] },
		"sshd" => { :package => "openssh-server", :ports => [ "TCP/22", "TCP/2222" ] },
		"postgres" => { :package => "postgresql-server", :ports => [ "TCP/5432" ] },
		"httpd" => { :package => "httpd", :ports => [ "TCP/80", "TCP/443" ] }
	}'
end
