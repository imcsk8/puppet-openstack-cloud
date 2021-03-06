#
# Copyright (C) 2015 eNovance SAS <licensing@enovance.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# == Class: cloud::database::nosql::redis
#
# Install a Redis server (used by OpenStack & monitoring services)
#
# === Parameters:
#
# [*port*]
#   (optional) Port where Redis is binded.
#   Used for firewall purpose.
#   Default to 6379
#
# [*firewall_settings*]
#   (optional) Allow to add custom parameters to firewall rules
#   Should be an hash.
#   Default to {}
#
class cloud::database::nosql::redis(
  $port              = 6379,
  $firewall_settings = {},
) {

  include ::redis

  if $::cloud::manage_firewall {
    cloud::firewall::rule{ '100 allow redis access':
      port   => $port,
      extras => $firewall_settings,
    }
  }

}
