puppet-snmp
===========

Description
-----------

A Puppet report processor for sending metrics to SNMP.

Requirements
------------

* `Puppet`
* SNMP Ruby bindings - the `libsnmp-ruby` package on Ubuntu/Debian, the
  `rubygem-snmp` package on Fedora/RHEL/CentOS and the `snmp` gem
  otherwise.
* An SNMP server

Installation & Usage
--------------------

1.  Install the `snmp` gem or appropriate package listed in Requirements
    above on your Puppet master

        $ sudo gem install snmp

2.  Install puppet-snmp as a module in your Puppet master's module
    path.

3.  Update the `snmp_server` and `snmp_port` variables in the `snmp.yaml` file with 
    your snmp server IP and port and copy the file to `/etc/puppet/`. An example file is included.

4.  Enable pluginsync and reports on your master and clients in `puppet.conf`

        [master]
        report = true
        reports = snmp
        pluginsync = true
        [agent]
        report = true
        pluginsync = true

5.  Run the Puppet client and sync the report as a plugin

Author
------

James Turnbull <james@lovedthanlost.net>

License
-------

    Author:: James Turnbull (<james@lovedthanlost.net>)
    Copyright:: Copyright (c) 2011 James Turnbull
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
